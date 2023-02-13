class CreateProjectsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :projects_joins, id: false do |t|
      t.bigint :project_id
      t.bigint :audio_id
      t.bigint :background_id
      t.bigint :video_id
    end

  add_index :projects_joins, :project_id
  add_index :projects_joins, :audio_id
  add_index :projects_joins, :background_id
  add_index :projects_joins, :video_id
  end
end
