class Project < ApplicationRecord
  generate_public_uid

  def to_param
    public_uid
  end

  belongs_to :user

  has_many :project_audios, dependent: :destroy
  has_many :audios, through: :project_audios

  has_many :project_backgrounds, dependent: :destroy
  has_many :backgrounds, through: :project_backgrounds

  has_many :project_videos, dependent: :destroy
  has_many :videos, through: :project_videos

  accepts_nested_attributes_for :videos, allow_destroy: true
  accepts_nested_attributes_for :backgrounds, allow_destroy: true
  accepts_nested_attributes_for :audios, allow_destroy: true

  validates :title, presence: true
  validate :check_video_count

  def check_video_count
    if videos.count > 3
      errors.add(:videos, "You cannot add more than three videos to a project")
    end
  end

  FONT = ['Covered By Your Grace','Gloria Hallelujah','Indie Flower','Inspiration','Kalam','Nanum Brush Script',
    'Nothing You Could Do','permanent marker', 'Reenie Beanie','Rock Salt','Shadows Into Light']
end
