class ChangeVideoBgremDefaultToFalse < ActiveRecord::Migration[7.0]
  def change
    change_column :videos, :bgrem_require, :boolean, default: false
  end
end
