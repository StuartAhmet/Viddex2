class RemoveColumnsFromTemplates < ActiveRecord::Migration[7.0]
  def change
    remove_column :templates, :video_title1, :string
    remove_column :templates, :video_title2, :string
    remove_column :templates, :video_title3, :string
    remove_column :templates, :video_title4, :string
    remove_column :templates, :video_script1, :text
    remove_column :templates, :video_script2, :text
    remove_column :templates, :video_script3, :text
    remove_column :templates, :video_script4, :text
    remove_column :templates, :tutorial_link, :string
  end
end
