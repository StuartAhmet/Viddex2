class CreateProjectLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :project_links do |t|
      t.references :background, null: false, foreign_key: true
      t.references :video, null: false, foreign_key: true
      t.references :audio, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
