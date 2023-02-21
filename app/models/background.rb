class Background < ApplicationRecord
  generate_public_uid

  def to_param
    public_uid
  end

  belongs_to :user
  has_one_attached :photo
  # has_many :project_links
  # has_many :projects, through: :project_links
  has_and_belongs_to_many :projects

  def title_with_thumbnail
    "<img src='#{cl_image_path(@background.image_attachment)}' /> #{title}".html_safe
  end


  validates :title, presence: true
  validates :title, uniqueness: { scope: :user }
  validates :photo, presence: true
end
