class AddFieldsToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :name, :string, unique: true
    add_column :companies, :public_uid, :string, unique: true
    add_column :companies, :industry, :string
    add_column :companies, :subscription_type, :string
    add_column :companies, :domain, :string, unique: true
    add_column :companies, :color_theme1, :string
    add_column :companies, :color_theme2, :string
  end
end
