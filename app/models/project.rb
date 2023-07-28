class Project < ApplicationRecord
  generate_public_uid

  def to_param
    public_uid
  end

  belongs_to :user

  has_many :project_templates, dependent: :destroy
  has_many :templates, through: :project_templates

  has_many :project_audios, dependent: :destroy
  has_many :audios, through: :project_audios

  has_many :project_backgrounds, dependent: :destroy
  has_many :backgrounds, through: :project_backgrounds

  has_many :project_videos, -> { order(position: :asc) }, dependent: :destroy
  has_many :videos, through: :project_videos
  accepts_nested_attributes_for :project_videos

  validates :title, presence: true

  def thumbnail_key
    if backgrounds.exists?
      backgrounds[0].photo.key
    else
      videos[0].file.key
    end
  end

  def resource_params
    if backgrounds.exists? && backgrounds[0].photo.content_type.include?("image")
      "image"
    else
      "video"
    end
  end

  def distortion_params
    if backgrounds[0].text_distortion?
      "distort: #{backgrounds[0].distort_nw_x}:#{backgrounds[0].distort_nw_y}:#{backgrounds[0].distort_ne_x}:#{backgrounds[0].distort_ne_y}:#{backgrounds[0].distort_se_x}:#{backgrounds[0].distort_se_y}:#{backgrounds[0].distort_sw_x}:#{backgrounds[0].distort_sw_y}:"
    else
      nil
    end

  end

  def message_params
    if message_body?
      {
        effect: distortion_params,
        gravity: "north_west",
        :overlay=>{
          font_family: font,
          font_size: font_size,
          text: message_body},
          opacity: opacity,
          width: backgrounds[0].width,
          height: backgrounds[0].text_box_height,
          x: backgrounds[0].x_axis,
          y: backgrounds[0].y_axis,
          crop: "fit",
          }
    else
      nil
    end
  end

  # project thumbnail
  def thumbnail_path
    Cloudinary::Utils.cloudinary_url("#{Rails.env}/#{thumbnail_key}.gif",
          resource_type: resource_params,
          secure: true,
          style: "border-bottom:5px solid black;",
          preload: "metadata",
          width: "100%",
          end_offset: "2",
          effect: "loop:5",
          :transformation=>[
            { height: 720, width: 1280, crop: "pad" },
            message_params,
              {:overlay=>"play-button-icon-png-18919_ssamfy", :opacity=>60, :width=>200, :crop=>"scale"},
          ].compact)
  end

  def audio_params
    if audios.exists?
      params_1 = {audio_codec:"none",end_offset:"1", quality:"auto", crop:"scale"}
      params_2 = {flags:"splice", overlay:"video:"+Rails.env+":"+videos[0].file.key, start_offset:"1"}
      params_3 = {:flags=>"layer_apply", :start_offset=>"2"}
      params_4 = {overlay: "video:"+Rails.env+":"+audios[0].file.key}
    else
      params_1 = nil
      params_2 = nil
      params_3 = nil
      params_4 = nil
    end
    return params_1, params_2, params_3, params_4
  end

  def video_params1
    if videos.count.to_i >1
      {flags:"splice", overlay:"video:"+Rails.env+":"+videos[1].file.key}
    else
      nil
    end
  end

  def video_params2
    if videos.count > 2
      {flags:"splice", overlay:"video:"+Rails.env+":"+videos[2].file.key}
    else
       nil
    end
  end

  # project video
  def project_path
    Cloudinary::Utils.cloudinary_url(Rails.env+"/"+videos[0].file.key+".mp4",
      secure: true,
      resource_type: "video",
      :transformation=>[
        audio_params,
        # params for multiple videos
        video_params1, video_params2,
      ].compact)
  end



  FONT = ['Covered By Your Grace', 'Gloria Hallelujah', 'Indie Flower',
          'Kalam', 'Nanum Brush Script', 'Nothing You Could Do', 'Permanent Marker',
          'Reenie Beanie', 'Rock Salt', 'Shadows Into Light']

end
