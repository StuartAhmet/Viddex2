class CreateBackgroundsProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :backgrounds_projects, id: false  do |t|
      t.references :project, null: false, foreign_key: true
      t.references :background, null: false, foreign_key: true

      t.timestamps
    end
  end
end
