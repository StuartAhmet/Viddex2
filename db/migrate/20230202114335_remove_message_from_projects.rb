class RemoveMessageFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :message
    remove_column :projects, :message_body_two
  end
end
