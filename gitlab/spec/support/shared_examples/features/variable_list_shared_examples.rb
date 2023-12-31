# frozen_string_literal: true

RSpec.shared_examples 'variable list' do
  it 'shows a list of variables' do
    page.within('[data-testid="ci-variable-table"]') do
      expect(find('.js-ci-variable-row:nth-child(1) td[data-label="Key"]')).to have_content(variable.key)
    end
  end

  it 'adds a new CI variable' do
    click_button('Add variable')

    fill_variable('key', 'key_value') do
      click_button('Add variable')
    end

    wait_for_requests

    page.within('[data-testid="ci-variable-table"]') do
      expect(find('.js-ci-variable-row:nth-child(1) td[data-label="Key"]')).to have_content('key')
    end
  end

  it 'adds a new protected variable' do
    click_button('Add variable')

    fill_variable('key', 'key_value') do
      click_button('Add variable')
    end

    wait_for_requests

    page.within('[data-testid="ci-variable-table"]') do
      expect(find(".js-ci-variable-row:nth-child(1) td[data-label='#{s_('CiVariables|Key')}']")).to have_content('key')
      expect(find(".js-ci-variable-row:nth-child(1) td[data-label='#{s_('CiVariables|Key')}']")).to have_content(s_('CiVariables|Protected'))
    end
  end

  it 'defaults to unmasked' do
    click_button('Add variable')

    fill_variable('key', 'key_value') do
      click_button('Add variable')
    end

    wait_for_requests

    page.within('[data-testid="ci-variable-table"]') do
      expect(find(".js-ci-variable-row:nth-child(1) td[data-label='#{s_('CiVariables|Key')}']")).to have_content('key')
      expect(find(".js-ci-variable-row:nth-child(1) td[data-label='#{s_('CiVariables|Key')}']")).not_to have_content(s_('CiVariables|Masked'))
    end
  end

  it 'reveals and hides variables' do
    page.within('[data-testid="ci-variable-table"]') do
      expect(first('.js-ci-variable-row td[data-label="Key"]')).to have_content(variable.key)
      expect(page).to have_content('*' * 5)

      click_button('Reveal value')

      expect(first('.js-ci-variable-row td[data-label="Key"]')).to have_content(variable.key)
      expect(first('.js-ci-variable-row td[data-label="Value"]')).to have_content(variable.value)
      expect(page).not_to have_content('*' * 5)

      click_button('Hide value')

      expect(first('.js-ci-variable-row td[data-label="Key"]')).to have_content(variable.key)
      expect(page).to have_content('*' * 5)
    end
  end

  it 'deletes a variable' do
    expect(page).to have_selector('.js-ci-variable-row', count: 1)

    page.within('[data-testid="ci-variable-table"]') do
      click_button('Edit')
    end

    page.within('#add-ci-variable') do
      click_button('Delete variable')
    end

    wait_for_requests

    expect(first('.js-ci-variable-row').text).to eq('There are no variables yet.')
  end

  it 'edits a variable' do
    page.within('[data-testid="ci-variable-table"]') do
      click_button('Edit')
    end

    page.within('#add-ci-variable') do
      find('[data-testid="pipeline-form-ci-variable-key"] input').set('new_key')

      click_button('Update variable')
    end

    wait_for_requests

    expect(first('.js-ci-variable-row td[data-label="Key"]')).to have_content('new_key')
  end

  it 'edits a variable to be unmasked' do
    page.within('[data-testid="ci-variable-table"]') do
      click_button('Edit')
    end

    page.within('#add-ci-variable') do
      find('[data-testid="ci-variable-protected-checkbox"]').click
      find('[data-testid="ci-variable-masked-checkbox"]').click

      click_button('Update variable')
    end

    wait_for_requests

    page.within('[data-testid="ci-variable-table"]') do
      expect(find(".js-ci-variable-row:nth-child(1) td[data-label='#{s_('CiVariables|Key')}']")).to have_content(s_('CiVariables|Protected'))
      expect(find(".js-ci-variable-row:nth-child(1) td[data-label='#{s_('CiVariables|Key')}']")).not_to have_content(s_('CiVariables|Masked'))
    end
  end

  it 'edits a variable to be masked' do
    page.within('[data-testid="ci-variable-table"]') do
      click_button('Edit')
    end

    page.within('#add-ci-variable') do
      find('[data-testid="ci-variable-masked-checkbox"]').click

      click_button('Update variable')
    end

    wait_for_requests

    page.within('[data-testid="ci-variable-table"]') do
      click_button('Edit')
    end

    page.within('#add-ci-variable') do
      find('[data-testid="ci-variable-masked-checkbox"]').click

      click_button('Update variable')
    end

    page.within('[data-testid="ci-variable-table"]') do
      expect(find(".js-ci-variable-row:nth-child(1) td[data-label='#{s_('CiVariables|Key')}']")).to have_content(s_('CiVariables|Masked'))
    end
  end

  it 'shows a validation error box about duplicate keys' do
    click_button('Add variable')

    fill_variable('key', 'key_value') do
      click_button('Add variable')
    end

    wait_for_requests

    click_button('Add variable')

    fill_variable('key', 'key_value') do
      click_button('Add variable')
    end

    wait_for_requests

    expect(find('.flash-container')).to be_present
    expect(find('[data-testid="alert-danger"]').text).to have_content('(key) has already been taken')
  end

  it 'allows variable to be added even if no value is provided' do
    click_button('Add variable')

    page.within('#add-ci-variable') do
      find('[data-testid="pipeline-form-ci-variable-key"] input').set('empty_mask_key')

      expect(find_button('Add variable', disabled: false)).to be_present
    end
  end

  it 'shows validation error box about unmaskable values' do
    click_button('Add variable')

    fill_variable('empty_mask_key', '???', protected: true, masked: true) do
      expect(page).to have_content('This variable value does not meet the masking requirements.')
      expect(find_button('Add variable', disabled: true)).to be_present
    end
  end

  it 'handles multiple edits and a deletion' do
    # Create two variables
    click_button('Add variable')

    fill_variable('akey', 'akeyvalue') do
      click_button('Add variable')
    end

    wait_for_requests

    click_button('Add variable')

    fill_variable('zkey', 'zkeyvalue') do
      click_button('Add variable')
    end

    wait_for_requests

    expect(page).to have_selector('.js-ci-variable-row', count: 3)

    # Remove the `akey` variable
    page.within('[data-testid="ci-variable-table"]') do
      page.within('.js-ci-variable-row:first-child') do
        click_button('Edit')
      end
    end

    page.within('#add-ci-variable') do
      click_button('Delete variable')
    end

    wait_for_requests

    # Add another variable
    click_button('Add variable')

    fill_variable('ckey', 'ckeyvalue') do
      click_button('Add variable')
    end

    wait_for_requests

    # expect to find 3 rows of variables in alphabetical order
    expect(page).to have_selector('.js-ci-variable-row', count: 3)
    rows = all('.js-ci-variable-row')
    expect(rows[0].find('td[data-label="Key"]')).to have_content('ckey')
    expect(rows[1].find('td[data-label="Key"]')).to have_content('test_key')
    expect(rows[2].find('td[data-label="Key"]')).to have_content('zkey')
  end

  context 'defaults to the application setting' do
    context 'application setting is true' do
      before do
        stub_application_setting(protected_ci_variables: true)

        visit page_path
      end

      it 'defaults to protected' do
        click_button('Add variable')

        page.within('#add-ci-variable') do
          expect(find('[data-testid="ci-variable-protected-checkbox"]')).to be_checked
        end
      end
    end

    context 'application setting is false' do
      before do
        stub_application_setting(protected_ci_variables: false)

        visit page_path
      end

      it 'defaults to unprotected' do
        click_button('Add variable')

        page.within('#add-ci-variable') do
          expect(find('[data-testid="ci-variable-protected-checkbox"]')).not_to be_checked
        end
      end

      it 'does not show a message regarding the default' do
        expect(page).not_to have_content 'Environment variables are configured by your administrator to be protected by default'
      end
    end
  end

  def fill_variable(key, value, protected: false, masked: false)
    wait_for_requests

    page.within('#add-ci-variable') do
      find('[data-testid="pipeline-form-ci-variable-key"] input').set(key)
      find('[data-testid="pipeline-form-ci-variable-value"]').set(value) if value.present?
      find('[data-testid="ci-variable-protected-checkbox"]').click if protected
      find('[data-testid="ci-variable-masked-checkbox"]').click if masked

      yield
    end
  end
end
