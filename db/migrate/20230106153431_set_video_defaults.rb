class SetVideoDefaults < ActiveRecord::Migration[7.0]
  def change
    change_column_default :videos, :text_width, 350
    change_column_default :videos, :x_axis, 350
    change_column_default :videos, :y_axis, 250
  end
end
