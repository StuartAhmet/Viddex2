class AddTemplateToProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :template, foreign_key: true
  end
end
