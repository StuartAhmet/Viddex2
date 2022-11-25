class Project < ApplicationRecord
  generate_public_uid

  def to_param
    public_uid
  end

  belongs_to :user
  belongs_to :background
  belongs_to :video

  validates :prospect_first, presence: true
  validates :prospect_company, presence: true
  validates :message, presence: true

  FONT = ['Covered By Your Grace','Gloria Hallelujah','Indie Flower','Inspiration','Kalam','Nanum Brush Script','Nothing You Could Do','Permanent Marker',
    'Reenie Beanie','Rock Salt','Shadows Into Light']
end
