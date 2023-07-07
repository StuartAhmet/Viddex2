class RemoveCategoryFromVideos < ActiveRecord::Migration[7.0]
  def change
    remove_column :videos, :category
    remove_reference :videos, :category, foreign_key: true

  end
end
