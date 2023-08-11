class CreateTemplateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :template_videos do |t|
      t.string :title
      t.text :video_script
      t.text :message
      t.string :image_url
      t.references :template, foreign_key: true
      t.timestamps
    end
  end
end
