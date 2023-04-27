class AddCompanyAdminToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :company_admin, :boolean, default: false

  end
end
