class AddElementstoUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company_name, :string
    add_column :users, :industry, :string
    add_column :users, :public_uid, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :full_name, :string
    add_column :users, :avatar_url, :string
    add_column :users, :admin, :boolean, default: false

  end
end
