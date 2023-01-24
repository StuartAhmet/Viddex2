class Video < ApplicationRecord
  generate_public_uid

  def to_param
    public_uid
  end

  belongs_to :user
  has_one_attached :file
  has_many :projects

  validates :title, presence: true
  validates :file, presence: true

  ROTATION = ['0', '90', '180', '270']
end
