class AddTutorialLinkToTemplates < ActiveRecord::Migration[7.0]
  def change
    add_column :templates, :tutorial_link, :text
  end
end
