class AddVideoItemsToTemplates < ActiveRecord::Migration[7.0]
  def change
    add_column :templates, :video_title1, :string
    add_column :templates, :video_title2, :string
    add_column :templates, :video_title3, :string
    add_column :templates, :video_title4, :string
    add_column :templates, :video_script1, :text
    add_column :templates, :video_script2, :text
    add_column :templates, :video_script3, :text
    add_column :templates, :video_script4, :text
    add_column :templates, :tutorial_link, :string
  end
end
