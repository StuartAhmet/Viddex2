class AddTextFieldToVideos < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :text_body, :text
  end
end
