# frozen_string_literal: true

class DropIndexNamespacesOnTypeAndVisibilityAndParentId < Gitlab::Database::Migration[2.1]
  disable_ddl_transaction!

  TABLE_NAME = 'namespaces'
  INDEX_NAME = 'index_namespaces_on_type_and_visibility_and_parent_id'
  CONDITIONS = "(type = 'Group' AND parent_id IS NULL AND visibility_level != 20)"

  def up
    remove_concurrent_index_by_name TABLE_NAME, INDEX_NAME
  end

  def down
    add_concurrent_index TABLE_NAME, :id, name: INDEX_NAME, where: CONDITIONS
  end
end
