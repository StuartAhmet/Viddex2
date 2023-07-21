class CreateTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :templates do |t|
      t.string :title
      t.string :category
      t.text :synopsis
      t.integer :video_count
      t.boolean :audio_required
      t.string :video_link
      t.timestamps
    end
    add_reference :projects, :template, foreign_key: true
  end
end
