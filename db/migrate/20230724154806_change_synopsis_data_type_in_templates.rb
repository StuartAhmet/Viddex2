class ChangeSynopsisDataTypeInTemplates < ActiveRecord::Migration[7.0]
  def change
    remove_column :templates, :synopsis
    add_column :templates, :synopsis, :text, limit: 16777215
  end
end
