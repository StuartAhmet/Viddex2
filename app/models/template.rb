class Template < ApplicationRecord
  generate_public_uid

  def to_param
    public_uid
  end
  belongs_to :user

  has_many :project_templates, dependent: :destroy
  has_many :projects, through: :project_templates
  # has_many :video_items, dependent: :destroy
  # accepts_nested_attributes_for :video_items, allow_destroy: true


end
