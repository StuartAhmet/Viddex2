class ChangeTemplateVideosColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :template_videos, :message
    remove_column :template_videos, :image_url
    add_column :template_videos, :message, :boolean
    add_column :template_videos, :image_url, :boolean
  end
end
