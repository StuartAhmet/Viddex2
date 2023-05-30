class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  generate_public_uid

  def to_param
    public_uid
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         # for Google OmniAuth
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name
      user.avatar_url = auth.info.image
      # if you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  # belongs_to :company
  has_many :videos
  has_many :categories
  has_many :backgrounds
  has_many :projects
  has_many :audios
  has_many :thumbnails
  # after_create :assign_company

  INDUSTRY = ["Advertising", "Finance", "Financial Services", "Information Technology", "Insurance",
              "Marketing", "Media", "Real Estate", "Recruitment", "Software", "Technology",
              "Telecommunications", "Other - not listed"]

  private
  def assign_company
    # Extract the domain from the user's email address
    domain = email.split('@').last
    # Find the company with the matching domain
    company = Company.find_by(domain: domain)
    # If no company is found, create a new one with the matching domain
    company ||= Company.create(domain: domain)
    # Assign the user to the company
    self.company = company
    save
  end

end
