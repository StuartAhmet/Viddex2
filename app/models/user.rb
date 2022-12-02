class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  generate_public_uid

  def to_param
    public_uid
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
          #  for Google OmniAuth
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name
      user.avatar_url = auth.info.image
    end
  end

  has_many :videos
  has_many :backgrounds
  has_many :projects

end
