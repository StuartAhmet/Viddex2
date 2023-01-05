class AddMessageTwoToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :message_body_two, :string
  end
end
