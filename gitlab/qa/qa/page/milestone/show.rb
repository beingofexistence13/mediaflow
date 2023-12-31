# frozen_string_literal: true

module QA
  module Page
    module Milestone
      class Show < Page::Base
        include Support::Dates

        view 'app/views/shared/milestones/_description.html.haml' do
          element 'milestone-description-content'
          element 'milestone-title-content', required: true
        end

        view 'app/views/shared/milestones/_sidebar.html.haml' do
          element 'due-date-content'
          element 'start-date-content'
        end

        def has_due_date?(due_date)
          formatted_due_date = format_date(due_date)
          has_element?('due-date-content', text: formatted_due_date)
        end

        def has_start_date?(start_date)
          formatted_start_date = format_date(start_date)
          has_element?('start-date-content', text: formatted_start_date)
        end
      end
    end
  end
end

QA::Page::Milestone::Show.prepend_mod_with('Page::Milestone::Show', namespace: QA)
