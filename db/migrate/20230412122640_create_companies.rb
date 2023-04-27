class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :public_uid
      t.string :industry
      t.string :subscription_type
      t.string :url
      t.string :color_theme
      t.string :subscription_type



      # t.references :user, foreign_key: true
      # t.boolean :bgrem_require, :default => true
      # t.boolean :bgrem_complete, :default => false

      t.timestamps
    end
  end
end
