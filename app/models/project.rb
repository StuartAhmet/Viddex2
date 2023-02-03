class Project < ApplicationRecord
  generate_public_uid

  def to_param
    public_uid
  end

  belongs_to :user
  has_many :backgrounds, through: :project_links
  has_many :videos, through: :project_links
  has_many :audios, through: :project_links

  validates :title, presence: true

  FONT = ['Covered By Your Grace','Gloria Hallelujah','Indie Flower','Inspiration','Kalam','Nanum Brush Script',
    'Nothing You Could Do','permanent marker', 'Reenie Beanie','Rock Salt','Shadows Into Light']
end
