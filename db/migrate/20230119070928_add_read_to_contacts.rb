class AddReadToContacts < ActiveRecord::Migration[7.0]
  def change
    add_column :contacts, :read, :boolean
  end
end
