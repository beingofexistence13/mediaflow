import { __ } from '~/locale';

export const ANY_OPTION = Object.freeze({
  id: null,
  name: __('Any'),
  name_with_namespace: __('Any'),
});

export const GROUP_DATA = {
  headerText: __('Filter results by group'),
  queryParam: 'group_id',
  name: 'name',
  fullName: 'full_name',
};

export const PROJECT_DATA = {
  headerText: __('Filter results by project'),
  queryParam: 'project_id',
  name: 'name',
  fullName: 'name_with_namespace',
};

export const SYNTAX_OPTIONS_ADVANCED_DOCUMENT = 'drawers/drawers/advanced_search_syntax.md';
export const SYNTAX_OPTIONS_ZOEKT_DOCUMENT = 'drawers/drawers/exact_code_search_syntax.md';
