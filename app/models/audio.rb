class Audio < ApplicationRecord
  generate_public_uid

  def to_param
    public_uid
  end

  belongs_to :user
  has_one_attached :file
  # has_many :project_links
  # has_many :projects, through: :project_links
  has_and_belongs_to_many :projects


  validates :title, presence: true
  validates :file, presence: true
end
