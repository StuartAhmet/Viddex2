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
end
