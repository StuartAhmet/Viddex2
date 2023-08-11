class Template < ApplicationRecord
  generate_public_uid

  def to_param
    public_uid
  end
  belongs_to :user
  has_many :template_videos, dependent: :destroy, inverse_of: :template
  accepts_nested_attributes_for :template_videos, allow_destroy: true, reject_if: :all_blank
  has_many :project_templates, dependent: :destroy
  has_many :projects, through: :project_templates

  def count_template_videos_with_message
    template_videos.where.not(message: [nil, ""]).count
  end

  def count_template_videos_with_image
    template_videos.where.not(image_url: [nil, ""]).count
  end
end
