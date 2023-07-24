class AddPublicUidToTemplates < ActiveRecord::Migration[7.0]
  def change
    add_column :templates, :public_uid, :string
  end
end
