class AddDistortionToBackgrounds < ActiveRecord::Migration[7.0]
  def change
    add_column :backgrounds, :distort_nw_x, :integer
    add_column :backgrounds, :distort_nw_y, :integer
    add_column :backgrounds, :distort_ne_x, :integer
    add_column :backgrounds, :distort_ne_y, :integer
    add_column :backgrounds, :distort_sw_x, :integer
    add_column :backgrounds, :distort_sw_y, :integer
    add_column :backgrounds, :distort_se_x, :integer
    add_column :backgrounds, :distort_se_y, :integer

  end
end
