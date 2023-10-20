# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'User uses shortcuts', :js, feature_category: :groups_and_projects do
  let_it_be(:user) { create(:user, :no_super_sidebar) }
  let_it_be(:project) { create(:project, :repository, namespace: user.namespace) }

  before do
    sign_in(user)

    visit(project_path(project))

    wait_for_requests
  end

  context 'when navigating to the Project pages' do
    it 'redirects to the project overview page' do
      visit project_issues_path(project)

      find('body').native.send_key('g')
      find('body').native.send_key('o')

      expect(page).to have_active_navigation(project.name)
    end

    it 'redirects to the activity page' do
      find('body').native.send_key('g')
      find('body').native.send_key('v')

      expect(page).to have_active_navigation('Project')
      expect(page).to have_active_sub_navigation('Activity')
    end
  end

  context 'when navigating to the Repository pages' do
    it 'redirects to the repository files page' do
      find('body').native.send_key('g')
      find('body').native.send_key('f')

      expect(page).to have_active_navigation('Repository')
      expect(page).to have_active_sub_navigation('Files')
    end

    it 'redirects to the repository commits page' do
      find('body').native.send_key('g')
      find('body').native.send_key('c')

      expect(page).to have_active_navigation('Repository')
      expect(page).to have_active_sub_navigation('Commits')
    end

    it 'redirects to the repository graph page' do
      find('body').native.send_key('g')
      find('body').native.send_key('n')

      expect(page).to have_active_navigation('Repository')
      expect(page).to have_active_sub_navigation('Graph')
    end

    it 'redirects to the repository charts page' do
      find('body').native.send_key('g')
      find('body').native.send_key('d')

      expect(page).to have_active_navigation(_('Analytics'))
      expect(page).to have_active_sub_navigation(_('Repository'))
    end
  end

  context 'when navigating to the Issues pages' do
    it 'redirects to the issues list page' do
      find('body').native.send_key('g')
      find('body').native.send_key('i')

      expect(page).to have_active_navigation('Issues')
      expect(page).to have_active_sub_navigation('List')
    end

    it 'redirects to the issue board page' do
      find('body').native.send_key('g')
      find('body').native.send_key('b')

      expect(page).to have_active_navigation('Issues')
      expect(page).to have_active_sub_navigation('Board')
    end

    it 'redirects to the new issue page' do
      find('body').native.send_key('i')

      expect(page).to have_content(project.title)
      expect(page).to have_content('New Issue')
    end
  end

  context 'when navigating to the Merge Requests pages' do
    it 'redirects to the merge requests page' do
      find('body').native.send_key('g')
      find('body').native.send_key('m')

      expect(page).to have_active_navigation('Merge requests')
    end
  end

  context 'when navigating to the CI/CD pages' do
    it 'redirects to the Pipelines page' do
      find('body').native.send_key('g')
      find('body').native.send_key('p')

      expect(page).to have_active_navigation('CI/CD')
      expect(page).to have_active_sub_navigation('Pipelines')
    end

    it 'redirects to the Jobs page' do
      find('body').native.send_key('g')
      find('body').native.send_key('j')

      expect(page).to have_active_navigation('CI/CD')
      expect(page).to have_active_sub_navigation('Jobs')
    end
  end

  context 'when navigating to the Deployments page' do
    it 'redirects to the Environments page' do
      find('body').native.send_key('g')
      find('body').native.send_key('e')

      expect(page).to have_active_navigation('Deployments')
      expect(page).to have_active_sub_navigation('Environments')
    end
  end

  context 'when navigating to the Infrastructure pages' do
    it 'redirects to the Kubernetes page' do
      find('body').native.send_key('g')
      find('body').native.send_key('k')

      expect(page).to have_active_navigation('Infrastructure')
      expect(page).to have_active_sub_navigation('Kubernetes')
    end
  end

  context 'when navigating to the Snippets pages' do
    it 'redirects to the snippets page' do
      find('body').native.send_key('g')
      find('body').native.send_key('s')

      expect(page).to have_active_navigation('Snippets')
    end
  end

  context 'when navigating to the Wiki pages' do
    it 'redirects to the wiki page' do
      find('body').native.send_key('g')
      find('body').native.send_key('w')

      expect(page).to have_active_navigation('Wiki')
    end
  end
end
