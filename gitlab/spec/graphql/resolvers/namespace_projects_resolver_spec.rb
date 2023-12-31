# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Resolvers::NamespaceProjectsResolver, feature_category: :groups_and_projects do
  include GraphqlHelpers

  let(:current_user) { create(:user) }
  let(:include_subgroups) { true }
  let(:not_aimed_for_deletion) { false }
  let(:sort) { nil }
  let(:search) { nil }
  let(:ids) { nil }
  let(:args) do
    {
      include_subgroups: include_subgroups,
      not_aimed_for_deletion: not_aimed_for_deletion,
      sort: sort,
      search: search,
      ids: ids
    }
  end

  context "with a group" do
    let(:group) { create(:group) }
    let(:namespace) { group }
    let(:project1) { create(:project, namespace: namespace) }
    let(:project2) { create(:project, namespace: namespace) }
    let(:project3) { create(:project, namespace: namespace, marked_for_deletion_at: 1.day.ago, pending_delete: true) }
    let(:nested_group) { create(:group, parent: group) }
    let(:nested_project) { create(:project, group: nested_group) }
    let(:nested_project2) { create(:project, group: nested_group, marked_for_deletion_at: 1.day.ago, pending_delete: true) }

    before do
      project1.add_developer(current_user)
      project2.add_developer(current_user)
      project3.add_developer(current_user)
      nested_project.add_developer(current_user)
      nested_project2.add_developer(current_user)
    end

    describe '#resolve' do
      it 'finds all projects' do
        expect(resolve_projects).to contain_exactly(project1, project2, project3)
      end

      it 'finds all projects including the subgroups' do
        expect(resolve_projects(args)).to contain_exactly(project1, project2, project3, nested_project, nested_project2)
      end

      it 'finds all projects not aimed for deletion' do
        arg = { not_aimed_for_deletion: true }

        expect(resolve_projects(arg)).to contain_exactly(project1, project2)
      end

      it 'finds all projects not aimed for deletion including the subgroups' do
        args[:not_aimed_for_deletion] = true

        expect(resolve_projects(args)).to contain_exactly(project1, project2, nested_project)
      end

      context 'with an user namespace' do
        let(:namespace) { current_user.namespace }

        it 'finds all projects' do
          expect(resolve_projects).to contain_exactly(project1, project2, project3)
        end

        it 'finds all projects including the subgroups' do
          expect(resolve_projects(args)).to contain_exactly(project1, project2, project3)
        end
      end
    end

    context 'search and similarity sorting' do
      let(:project_1) { create(:project, name: 'Project', path: 'project', namespace: namespace) }
      let(:project_2) { create(:project, name: 'Test Project', path: 'test-project', namespace: namespace) }
      let(:project_3) { create(:project, name: 'Test', path: 'test', namespace: namespace) }

      let(:sort) { :similarity }
      let(:search) { 'test' }

      before do
        project_1.add_developer(current_user)
        project_2.add_developer(current_user)
        project_3.add_developer(current_user)
      end

      it 'returns projects ordered by similarity to the search input' do
        projects = resolve_projects(args)

        project_names = projects.map { |proj| proj['name'] }
        expect(project_names.first).to eq('Test')
        expect(project_names.second).to eq('Test Project')
      end

      it 'filters out result that do not match the search input' do
        projects = resolve_projects(args)

        project_names = projects.map { |proj| proj['name'] }
        expect(project_names).not_to include('Project')
      end

      context 'when `search` parameter is not given' do
        let(:search) { nil }

        it 'returns projects not ordered by similarity' do
          projects = resolve_projects(args)

          project_names = projects.map { |proj| proj['name'] }
          expect(project_names.first).not_to eq('Test')
        end
      end

      context 'when only search term is given' do
        let(:sort) { nil }
        let(:search) { 'test' }

        it 'filters out result that do not match the search input, but does not sort them' do
          projects = resolve_projects(args)

          project_names = projects.map { |proj| proj['name'] }
          expect(project_names).to contain_exactly('Test', 'Test Project')
        end
      end
    end

    context 'ids filtering' do
      subject(:projects) { resolve_projects(args) }

      let(:include_subgroups) { false }
      let!(:project_4) { create(:project, name: 'Project', path: 'project', namespace: namespace) }

      context 'when ids is provided' do
        let(:ids) { [project_4.to_global_id.to_s] }

        it 'returns matching project' do
          expect(projects).to contain_exactly(project_4)
        end
      end

      context 'when ids is nil' do
        let(:ids) { nil }

        it 'returns all projects' do
          expect(projects).to contain_exactly(project1, project2, project3, project_4)
        end
      end
    end
  end

  context "when passing a non existent, batch loaded namespace" do
    let(:namespace) do
      BatchLoader::GraphQL.for("non-existent-path").batch do |_fake_paths, loader, _|
        loader.call("non-existent-path", nil)
      end
    end

    it "returns nil without breaking" do
      expect(resolve_projects).to be_empty
    end
  end

  it 'has an high complexity regardless of arguments' do
    field = Types::BaseField.new(name: 'test', type: GraphQL::Types::String.connection_type, resolver_class: described_class, null: false, max_page_size: 100)

    expect(field.complexity.call({}, {}, 1)).to eq 24
    expect(field.complexity.call({}, { include_subgroups: true }, 1)).to eq 24
  end

  def resolve_projects(args = { include_subgroups: false, sort: nil, search: nil, ids: nil }, context = { current_user: current_user })
    resolve(described_class, obj: namespace, args: args, ctx: context, arg_style: :internal)
  end
end
