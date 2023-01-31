class AddReasonToContacts < ActiveRecord::Migration[7.0]
  def change
    add_column :contacts, :reason, :string
  end
end
