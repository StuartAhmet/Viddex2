class Video < ApplicationRecord
  generate_public_uid

  def to_param
    public_uid
  end

  def service_url
    "https://res.cloudinary.com/dth8lnhas/video/upload/#{Rails.env}/#{file.key}.jpg"
  end

  def video_options
    Video.all.map do |v|
    ["#{v.title} - #{v.file.service_url}"]
    end
  end

  belongs_to :user
  has_one_attached :file
  # has_many :project_links
  # has_many :projects, through: :project_links
  has_and_belongs_to_many :projects


  validates :title, presence: true
  validates :file, presence: true

  ROTATION = ['0', '90', '180', '270']
end
