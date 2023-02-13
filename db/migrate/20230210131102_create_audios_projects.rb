class CreateAudiosProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :audios_projects, id: false do |t|
      t.references :project, null: false, foreign_key: true
      t.references :audio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
