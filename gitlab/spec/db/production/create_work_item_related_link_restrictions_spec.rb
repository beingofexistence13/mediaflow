# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Create work item related links restrictions in production', feature_category: :portfolio_management do
  subject { load Rails.root.join('db/fixtures/production/040_create_work_item_related_link_restrictions.rb') }

  it_behaves_like 'work item related links restrictions importer'
end
