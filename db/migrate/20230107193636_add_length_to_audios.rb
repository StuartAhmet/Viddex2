class AddLengthToAudios < ActiveRecord::Migration[7.0]
  def change
    add_column :audios, :length, :float
  end
end
