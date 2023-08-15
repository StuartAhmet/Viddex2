class Audio < ApplicationRecord
  generate_public_uid

  def to_param
    public_uid
  end

  belongs_to :user
  has_one_attached :file
  # has_and_belongs_to_many :projects
  has_many :project_audios
  has_many :projects, through: :project_audios, dependent: :destroy


  validates :title, presence: true
  validates :file, presence: true

  def file_size
    file.byte_size.to_f/ 1048576
  end

  def duration_in_seconds
    audio = Cloudinary::Api.resource(file.key, resource_type: 'video')
    audio['duration']
  end

end
