class AddElementsToVideos < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :distort_nw_x, :integer
    add_column :videos, :distort_nw_y, :integer
    add_column :videos, :distort_ne_x, :integer
    add_column :videos, :distort_ne_y, :integer
    add_column :videos, :distort_sw_x, :integer
    add_column :videos, :distort_sw_y, :integer
    add_column :videos, :distort_se_x, :integer
    add_column :videos, :distort_se_y, :integer
    add_column :videos, :text_width, :integer
    add_column :videos, :x_axis, :integer
    add_column :videos, :y_axis, :integer
    add_column :videos, :angle, :integer


  end
end
