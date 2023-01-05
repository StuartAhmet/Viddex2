class AddHeightToModels < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :text_box_height, :integer, default: 200
    add_column :backgrounds, :text_box_height, :integer, default: 200
  end
end
