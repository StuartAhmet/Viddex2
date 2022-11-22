class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :public_uid
      t.string :rotation
      t.references :user, foreign_key: true
      t.boolean :bgrem_require, :default => true
      t.boolean :bgrem_complete, :default => false
      t.timestamps
    end
  end
end
