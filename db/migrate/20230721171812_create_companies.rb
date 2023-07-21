class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :public_uid
      t.string :industry
      t.string :subscription_type
      t.string :domain
      t.string :color_theme1
      t.string :color_theme2
      t.timestamps
    end
    add_reference :users, :company, foreign_key: true
  end
end
