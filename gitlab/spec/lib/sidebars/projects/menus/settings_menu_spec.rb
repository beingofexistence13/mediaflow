# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Sidebars::Projects::Menus::SettingsMenu, feature_category: :navigation do
  let(:project) { build_stubbed(:project) }

  let(:user) { project.first_owner }
  let(:context) { Sidebars::Projects::Context.new(current_user: user, container: project) }

  subject { described_class.new(context) }

  describe '#render?' do
    it 'returns false when menu does not have any menu items' do
      allow(subject).to receive(:has_renderable_items?).and_return(false)

      expect(subject.render?).to be false
    end
  end

  describe '#separated?' do
    it 'returns true' do
      expect(subject.separated?).to be true
    end
  end

  describe 'Menu items' do
    subject { described_class.new(context).renderable_items.find { |e| e.item_id == item_id } }

    shared_examples 'access rights checks' do
      specify { is_expected.not_to be_nil }

      describe 'when the user does not have access' do
        let(:user) { nil }

        specify { is_expected.to be_nil }
      end
    end

    describe 'General' do
      let(:item_id) { :general }

      it_behaves_like 'access rights checks'
    end

    describe 'Integrations' do
      let(:item_id) { :integrations }

      it_behaves_like 'access rights checks'
    end

    describe 'Webhooks' do
      let(:item_id) { :webhooks }

      it_behaves_like 'access rights checks'
    end

    describe 'Access Tokens' do
      let(:item_id) { :access_tokens }

      it_behaves_like 'access rights checks'

      describe 'when the user is not an admin but has manage_resource_access_tokens' do
        before do
          allow(Ability).to receive(:allowed?).and_call_original
          allow(Ability).to receive(:allowed?).with(user, :admin_project, project).and_return(false)
          allow(Ability).to receive(:allowed?).with(user, :manage_resource_access_tokens, project).and_return(true)
        end

        it 'includes access token menu item' do
          expect(subject.title).to eql('Access Tokens')
        end
      end
    end

    describe 'Repository' do
      let(:item_id) { :repository }

      it_behaves_like 'access rights checks'
    end

    describe 'CI/CD' do
      let(:item_id) { :ci_cd }

      describe 'when project is archived' do
        before do
          allow(project).to receive(:archived?).and_return(true)
        end

        specify { is_expected.to be_nil }
      end

      describe 'when project is not archived' do
        specify { is_expected.not_to be_nil }

        describe 'when the user does not have access' do
          let(:user) { nil }

          specify { is_expected.to be_nil }
        end
      end
    end

    describe 'Monitor' do
      let(:item_id) { :monitor }

      describe 'when project is archived' do
        before do
          allow(project).to receive(:archived?).and_return(true)
        end

        specify { is_expected.to be_nil }
      end

      describe 'when project is not archived' do
        specify { is_expected.not_to be_nil }

        specify { expect(subject.title).to eq 'Monitor' }

        describe 'when the user does not have access' do
          let(:user) { nil }

          specify { is_expected.to be_nil }
        end
      end
    end

    describe 'Merge requests' do
      let(:item_id) { :merge_requests }

      it_behaves_like 'access rights checks'
    end

    describe 'Packages and registries' do
      let(:item_id) { :packages_and_registries }
      let(:packages_enabled) { false }

      before do
        stub_container_registry_config(enabled: container_enabled)
        stub_config(packages: { enabled: packages_enabled })
      end

      describe 'when container registry setting is disabled' do
        let(:container_enabled) { false }

        specify { is_expected.to be_nil }
      end

      describe 'when container registry setting is enabled' do
        let(:container_enabled) { true }

        specify { is_expected.not_to be_nil }

        describe 'when the user does not have access' do
          let(:user) { nil }

          specify { is_expected.to be_nil }
        end
      end

      describe 'when package registry setting is enabled' do
        let(:container_enabled) { false }
        let(:packages_enabled) { true }

        specify { is_expected.not_to be_nil }

        describe 'when the user does not have access' do
          let(:user) { nil }

          specify { is_expected.to be_nil }
        end
      end
    end

    describe 'Usage Quotas' do
      let(:item_id) { :usage_quotas }

      specify { is_expected.not_to be_nil }

      describe 'when the user does not have access' do
        let(:user) { nil }

        specify { is_expected.to be_nil }
      end
    end
  end
end