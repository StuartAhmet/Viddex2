class AddDistortionToModels < ActiveRecord::Migration[7.0]
  def change
    add_column :backgrounds, :text_distortion, :boolean, default: false
    add_column :videos, :text_distortion, :boolean, default: false
  end
end
