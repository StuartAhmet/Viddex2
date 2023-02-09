class CreateProjectVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :project_videos do |t|
      t.integer :project_id, null: false
      t.integer :video_id, null: false
      t.timestamps
    end

    add_index :project_videos, [:project_id, :video_id], unique: true
  end
end
