class AddCategorytoVideos < ActiveRecord::Migration[7.0]
  def change
    add_reference :videos, :category, foreign_key: true

  end
end
