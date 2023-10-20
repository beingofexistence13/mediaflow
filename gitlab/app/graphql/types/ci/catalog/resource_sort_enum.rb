# frozen_string_literal: true

module Types
  module Ci
    module Catalog
      class ResourceSortEnum < SortEnum
        graphql_name 'CiCatalogResourceSort'
        description 'Values for sorting catalog resources'

        value 'NAME_ASC', 'Name by ascending order.', value: :name_asc
        value 'NAME_DESC', 'Name by descending order.', value: :name_desc
        value 'LATEST_RELEASED_AT_ASC', 'Latest release date by ascending order.', value: :latest_released_at_asc
        value 'LATEST_RELEASED_AT_DESC', 'Latest release date by descending order.', value: :latest_released_at_desc
      end
    end
  end
end