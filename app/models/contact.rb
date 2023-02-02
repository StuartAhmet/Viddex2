class Contact < ActiveRecord::Base
  before_create :set_default_value

  attribute :first_name, :string
  attribute :last_name, :string
  attribute :email, :string
  attribute :reason, :string
  attribute :notes, :text
  attribute :country, :string
  attribute :job_title, :string
  attribute :read, :boolean, default: false

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :reason, presence: true
  validates :notes, presence: true
  validates :country, presence: true
  validates :job_title, presence: true

  private

  def set_default_value
    self.read ||= false
  end
end
