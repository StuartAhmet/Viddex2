class ChangeForeignKeyVideoCategories < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :categories, :videos
    add_reference :videos, :category, foreign_key: true


  end
end
