# frozen_string_literal: true

class AddPartialIndexOnGroupPathId < Gitlab::Database::Migration[2.1]
  disable_ddl_transaction!

  INDEX_NAME = :index_groups_on_path_and_id

  # rubocop:disable Migration/PreventIndexCreation
  def up
    add_concurrent_index :namespaces, [:path, :id], where: "type = 'Group'", name: INDEX_NAME
  end
  # rubocop:enable Migration/PreventIndexCreation

  def down
    remove_concurrent_index_by_name :namespaces, INDEX_NAME
  end
end
