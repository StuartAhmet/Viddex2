class CreateBackgrounds < ActiveRecord::Migration[7.0]
  def change
    create_table :backgrounds do |t|
      t.string :title
      t.string :public_uid
      t.integer :x_axis, default: 350
      t.integer :y_axis, default: 250
      t.integer :width, default: 350
      t.integer :angle, default: 0
      t.timestamps
    end
  end
end
