class Background < ApplicationRecord
  generate_public_uid

  def to_param
    public_uid
  end

  belongs_to :user
  has_one_attached :photo
  has_many :project_backgrounds
  has_many :projects, through: :project_backgrounds, dependent: :destroy

  def title_with_thumbnail
    "<img src='#{cl_image_path(@background.image_attachment)}' /> #{title}".html_safe
  end

  def file_size
    photo.byte_size.to_f/ 1048576
  end

  def bg_key
    if photo.content_type.include? "video"
      "#{Rails.env}/#{photo.key}.gif"
    elsif photo.content_type.include? "image"
      "#{Rails.env}/#{photo.key}"
    end
  end

  def distortion_params
    if text_distortion?
      "distort:"+distort_nw_x.to_s+":"+distort_nw_y.to_s+":"+distort_ne_x.to_s+":"+distort_ne_y.to_s+":"+distort_se_x.to_s+":"+distort_se_y.to_s+":"+distort_sw_x.to_s+":"+distort_sw_y.to_s
    else
      nil
    end
  end

  def resource
    if photo.content_type.include? "video"
      "video"
    else
      "image"
    end
  end

  def card_path
    Cloudinary::Utils.cloudinary_url(bg_key,
      resource_type: resource,
      secure: true,
      :transformation=>[
        { height: 720, width: 1280, crop: "pad" },
        ])
  end

  def cl_path
    Cloudinary::Utils.cloudinary_url(bg_key,
      resource_type: resource,
      secure: true,
      :transformation=>[
        { height: 720, width: 1280, crop: "pad"},
        { angle: angle, border: "1px_solid_rgb:000", effect: distortion_params, height: text_box_height, gravity: "north_west",
      :overlay=>{ font_family: "arial", font_size: 45, text: "hello%20viewers" },
      width: width, x: x_axis, y: y_axis, crop: "scale" }
        ])
  end

  validates :title, presence: true
  validates :title, uniqueness: { scope: :user }
  validates :photo, presence: true
end
