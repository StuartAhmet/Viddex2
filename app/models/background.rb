class Background < ApplicationRecord
  generate_public_uid

  def to_param
    public_uid
  end

  belongs_to :user
  has_one_attached :photo
  has_many :project_links
  has_many :projects, through: :project_links




  validates :title, presence: true
  validates :title, uniqueness: { scope: :user }
  validates :photo, presence: true
end
