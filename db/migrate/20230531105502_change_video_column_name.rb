class ChangeVideoColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :videos, :rotation, :industry
  end
end
