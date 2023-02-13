class DropProjectLinksAndProjectJoins < ActiveRecord::Migration[7.0]
  def change
    drop_table :project_links
    drop_table :projects_joins
  end
end
