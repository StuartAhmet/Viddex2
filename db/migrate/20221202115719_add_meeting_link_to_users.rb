class AddMeetingLinkToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :meeting_link, :string
  end
end
