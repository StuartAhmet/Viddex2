class CreateProjectBackgrounds < ActiveRecord::Migration[7.0]
  def change
    create_table :project_backgrounds do |t|
      t.integer :project_id
      t.integer :background_id
      t.timestamps
    end

    add_index :project_backgrounds, [:project_id, :background_id], unique: true
  end
end
