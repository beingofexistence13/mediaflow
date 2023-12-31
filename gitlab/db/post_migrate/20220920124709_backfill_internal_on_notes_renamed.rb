# frozen_string_literal: true

# Renamed from BackfillInternalOnNotes to BackfillInternalOnNotesRenamed to avoid collision with an Elasticsearch
# migration  from the same name. See https://gitlab.com/gitlab-org/gitlab/-/merge_requests/129012
class BackfillInternalOnNotesRenamed < Gitlab::Database::Migration[2.0]
  MIGRATION = 'BackfillInternalOnNotes'
  DELAY_INTERVAL = 2.minutes
  TABLE = :notes
  BATCH_SIZE = 2000
  SUB_BATCH_SIZE = 10

  restrict_gitlab_migration gitlab_schema: :gitlab_main

  def up
    queue_batched_background_migration(
      MIGRATION,
      TABLE,
      :id,
      job_interval: DELAY_INTERVAL,
      batch_size: BATCH_SIZE,
      sub_batch_size: SUB_BATCH_SIZE
    )
  end

  def down
    delete_batched_background_migration(MIGRATION, TABLE, :id, [])
  end
end
