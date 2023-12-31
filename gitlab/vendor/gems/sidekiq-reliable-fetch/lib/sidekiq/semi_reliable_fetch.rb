# frozen_string_literal: true

module Sidekiq
  class SemiReliableFetch < BaseReliableFetch
    # We want the fetch operation to timeout every few seconds so the thread
    # can check if the process is shutting down. This constant is only used
    # for semi-reliable fetch.
    DEFAULT_SEMI_RELIABLE_FETCH_TIMEOUT = 2 # seconds

    def initialize(options)
      super

      @alternative_store = options[:alternative_store]
      @namespace = options[:namespace]

      @queues = @queues + @queues.map { |q| "#{@namespace}:#{q}" } if @namespace

      if strictly_ordered_queues
        @queues = @queues.uniq
        @queues << { timeout: semi_reliable_fetch_timeout }
      end
    end

    private

    def retrieve_unit_of_work
      work = with_redis { |conn| conn.brpop(*queues_cmd) }
      return unless work

      queue, job = work
      queue = queue.to_s.sub(/\A#{@namespace}:/, '') if @namespace
      unit_of_work = UnitOfWork.new(queue, job)

      Sidekiq.redis do |conn|
        conn.lpush(self.class.working_queue_name(unit_of_work.queue), unit_of_work.job)
      end

      unit_of_work
    end

    def with_redis(&blk)
      if @alternative_store
        @alternative_store.with(&blk)
      else
        Sidekiq.redis(&blk)
      end
    end

    def queues_cmd
      if strictly_ordered_queues
        @queues
      else
        queues = @queues.shuffle.uniq
        queues << { timeout: semi_reliable_fetch_timeout }
        queues
      end
    end

    def semi_reliable_fetch_timeout
      @semi_reliable_fetch_timeout ||= ENV['SIDEKIQ_SEMI_RELIABLE_FETCH_TIMEOUT']&.to_i || DEFAULT_SEMI_RELIABLE_FETCH_TIMEOUT
    end
  end
end
