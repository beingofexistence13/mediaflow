# frozen_string_literal: true

module Gitlab
  module AlertManagement
    module Payload
      MONITORING_TOOLS = {
        prometheus: 'Prometheus'
      }.freeze

      class << self
        # Instantiates an instance of a subclass of
        # Gitlab::AlertManagement::Payload::Base. This can
        # be used to create new alerts or read content from
        # the payload of an existing AlertManagement::Alert
        #
        # @param project [Project]
        # @param payload [Hash]
        # @param monitoring_tool [String]
        # @param integration [AlertManagement::HttpIntegration]
        def parse(project, payload, monitoring_tool: nil, integration: nil)
          payload_class = payload_class_for(monitoring_tool: monitoring_tool || payload&.dig('monitoring_tool'))

          payload_class.new(project: project, payload: payload, integration: integration)
        end

        private

        def payload_class_for(monitoring_tool:)
          if monitoring_tool == MONITORING_TOOLS[:prometheus]
            ::Gitlab::AlertManagement::Payload::Prometheus
          else
            ::Gitlab::AlertManagement::Payload::Generic
          end
        end
      end
    end
  end
end
