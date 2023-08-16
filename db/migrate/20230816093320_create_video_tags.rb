class CreateVideoTags < ActiveRecord::Migration[7.0]
  def change
    create_table :video_tags do |t|
      t.string :title
      t.references :video, foreign_key: true
      t.timestamps
    end
  end
end
