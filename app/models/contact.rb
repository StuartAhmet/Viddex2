class Contact < ActiveRecord::Base
  before_create :set_default_value

  attribute :first_name, :string
  attribute :last_name, :string
  attribute :email, :string
  attribute :notes, :text
  attribute :country, :string
  attribute :job_title, :string
  attribute :read, :boolean, default: false

  private

  def set_default_value
    self.read ||= false
  end
end
