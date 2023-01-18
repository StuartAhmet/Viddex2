class Contact < ActiveRecord::Base
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :email, :string
  attribute :notes, :text
  attribute :country, :string
  attribute :job_title, :string
end
