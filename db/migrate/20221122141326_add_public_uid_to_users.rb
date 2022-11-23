class AddPublicUidToUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :public_uid, unique: true
  end
end
