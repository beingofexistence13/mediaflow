# frozen_string_literal: true

module Gitlab
  module Database
    class BatchCounter
      FALLBACK = -1
      MIN_REQUIRED_BATCH_SIZE = 1_250
      DEFAULT_SUM_BATCH_SIZE = 1_000
      MAX_ALLOWED_LOOPS = 10_000
      SLEEP_TIME_IN_SECONDS = 0.01 # 10 msec sleep
      ALLOWED_MODES = [:itself, :distinct].freeze
      FALLBACK_FINISH = 0
      OFFSET_BY_ONE = 1

      # Each query should take < 500ms https://gitlab.com/gitlab-org/gitlab/-/merge_requests/22705
      DEFAULT_DISTINCT_BATCH_SIZE = 10_000
      DEFAULT_BATCH_SIZE = 100_000

      def initialize(relation, column: nil, operation: :count, operation_args: nil, max_allowed_loops: nil)
        @relation = relation
        @column = column || relation.primary_key
        @operation = operation
        @operation_args = operation_args
        @max_allowed_loops = max_allowed_loops || MAX_ALLOWED_LOOPS
      end

      def unwanted_configuration?(finish, batch_size, start)
        (@operation == :count && batch_size <= MIN_REQUIRED_BATCH_SIZE) ||
          (@operation == :sum && batch_size < DEFAULT_SUM_BATCH_SIZE) ||
          (finish - start) / batch_size >= @max_allowed_loops ||
          start >= finish
      end

      def count(batch_size: nil, mode: :itself, start: nil, finish: nil)
        result = count_with_timeout(batch_size: batch_size, mode: mode, start: start, finish: finish, timeout: nil)

        return FALLBACK if result[:status] != :completed

        result[:count]
      end

      def count_with_timeout(batch_size: nil, mode: :itself, start: nil, finish: nil, timeout: nil, partial_results: nil)
        raise 'BatchCount can not be run inside a transaction' if transaction_open?

        check_mode!(mode)

        # non-distinct have better performance
        batch_size ||= batch_size_for_mode_and_operation(mode, @operation)

        start = actual_start(start)
        finish = actual_finish(finish)

        raise "Batch counting expects positive values only for #{@column}" if start < 0 || finish < 0
        return { status: :bad_config } if unwanted_configuration?(finish, batch_size, start)

        results = partial_results
        batch_start = start

        start_time = ::Gitlab::Metrics::System.monotonic_time.seconds

        while batch_start < finish

          # Timeout elapsed, return partial result so the caller can continue later
          if timeout && ::Gitlab::Metrics::System.monotonic_time.seconds - start_time > timeout
            return { status: :timeout, partial_results: results, continue_from: batch_start }
          end

          begin
            batch_end = [batch_start + batch_size, finish].min
            batch_relation = build_relation_batch(batch_start, batch_end, mode)

            results = merge_results(results, batch_relation.send(@operation, *@operation_args)) # rubocop:disable GitlabSecurity/PublicSend
            batch_start = batch_end
          rescue ActiveRecord::QueryCanceled => error
            # retry with a safe batch size & warmer cache
            if batch_size >= 2 * MIN_REQUIRED_BATCH_SIZE
              batch_size /= 2
            else
              log_canceled_batch_fetch(batch_start, mode, batch_relation.to_sql, error)
              return { status: :cancelled }
            end
          end

          sleep(SLEEP_TIME_IN_SECONDS)
        end

        { status: :completed, count: results }
      end

      def transaction_open?
        @relation.connection.transaction_open?
      end

      def merge_results(results, object)
        return object unless results

        if object.is_a?(Hash)
          results.merge!(object) { |_, a, b| a + b }
        else
          results + object
        end
      end

      private

      def build_relation_batch(start, finish, mode)
        @relation.select(@column).public_send(mode).where(between_condition(start, finish)) # rubocop:disable GitlabSecurity/PublicSend
      end

      def batch_size_for_mode_and_operation(mode, operation)
        return DEFAULT_SUM_BATCH_SIZE if operation == :sum

        mode == :distinct ? DEFAULT_DISTINCT_BATCH_SIZE : DEFAULT_BATCH_SIZE
      end

      def between_condition(start, finish)
        return @column.between(start...finish) if @column.is_a?(Arel::Attributes::Attribute)

        { @column => start...finish }
      end

      def actual_start(start)
        start || @relation.unscope(:group, :having).minimum(@column) || 0
      end

      def actual_finish(finish)
        (finish || @relation.unscope(:group, :having).maximum(@column) || FALLBACK_FINISH) + OFFSET_BY_ONE
      end

      def check_mode!(mode)
        raise "The mode #{mode.inspect} is not supported" unless ALLOWED_MODES.include?(mode)
        raise 'Use distinct count for optimized distinct counting' if @relation.limit(1).distinct_value.present? && mode != :distinct
        raise 'Use distinct count only with non id fields' if @column == :id && mode == :distinct
      end

      def log_canceled_batch_fetch(batch_start, mode, query, error)
        Gitlab::AppJsonLogger
          .error(
            event: 'batch_count',
            relation: @relation.table_name,
            operation: @operation,
            operation_args: @operation_args,
            max_allowed_loops: @max_allowed_loops,
            start: batch_start,
            mode: mode,
            query: query,
            message: "Query has been canceled with message: #{error.message}"
          )
      end
    end
  end
end
