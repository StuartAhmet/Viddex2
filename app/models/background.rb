class Background < ApplicationRecord
  generate_public_uid

  def to_param
    public_uid
  end

  def service_url
    if photo.content_type.include? "video"
      "https://res.cloudinary.com/dth8lnhas/video/upload/#{Rails.env}/#{photo.key}.jpg"
    elsif photo.content_type.include? "image"
      "http://res.cloudinary.com/dth8lnhas/image/upload/#{Rails.env}/#{photo.key}"
    end
  end

  belongs_to :user
  has_one_attached :photo
  has_many :project_backgrounds
  has_many :projects, through: :project_backgrounds, dependent: :destroy

  def title_with_thumbnail
    "<img src='#{cl_image_path(@background.image_attachment)}' /> #{title}".html_safe
  end


  validates :title, presence: true
  validates :title, uniqueness: { scope: :user }
  validates :photo, presence: true
end
