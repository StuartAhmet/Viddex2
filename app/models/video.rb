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
  belongs_to :category
  has_one_attached :file

  has_many :project_videos
  has_many :projects, through: :project_videos, dependent: :destroy
  # has_and_belongs_to_many :projects
  scope :by_posiiton, -> { joins(:project_videos).order('project_video.position ASC')}


  validates :title, presence: true
  validates :file, presence: true

  def file_size
    file.byte_size.to_f/ 1048576
  end

end
