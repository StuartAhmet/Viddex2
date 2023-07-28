class CreateProjectTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :project_templates do |t|
      t.references :project, foreign_key: true
      t.references :template, foreign_key: true
      t.timestamps
    end
    add_index :project_templates, [:project_id, :template_id], unique: true
  end
end
