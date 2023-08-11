class AddInstructionsToTemplateVideos < ActiveRecord::Migration[7.0]
  def change
    add_column :template_videos, :video_instructions, :text
    add_column :template_videos, :message_instructions, :text
    add_column :template_videos, :image_instructions, :text
  end
end
