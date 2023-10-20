# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../lib/tasks/gitlab/audit_event_types/compile_docs_task'

RSpec.describe Tasks::Gitlab::AuditEventTypes::CompileDocsTask, feature_category: :audit_events do
  let(:docs_dir) { Rails.root.join("tmp/tests/doc/administration/audit_event_streaming") }
  let(:docs_path) { Rails.root.join(docs_dir, 'audit_event_types.md') }
  let(:template_erb_path) { Rails.root.join("tooling/audit_events/docs/templates/audit_event_types.md.erb") }

  subject(:compile_docs_task) { described_class.new(docs_dir, docs_path, template_erb_path) }

  describe '#run' do
    it 'outputs message after compiling the documentation' do
      expect { subject.run }.to output("Documentation compiled.\n").to_stdout
    end

    it 'creates audit_event_types.md', :aggregate_failures do
      FileUtils.rm_f(docs_path)

      expect { File.read(docs_path) }.to raise_error(Errno::ENOENT)

      subject.run

      expect(File.read(docs_path).size).not_to eq(0)
      expect(File.read(docs_path)).to match(/This documentation is auto generated by a Rake task/)
    end
  end
end
