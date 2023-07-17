class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :title
      add_reference :categories, :video, foreign_key: true

      t.timestamps
    end
  end
end
