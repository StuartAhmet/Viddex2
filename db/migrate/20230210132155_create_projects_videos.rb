class CreateProjectsVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :projects_videos, id: false  do |t|
      t.references :project, null: false, foreign_key: true
      t.references :video, null: false, foreign_key: true

      t.timestamps
    end
  end
end
