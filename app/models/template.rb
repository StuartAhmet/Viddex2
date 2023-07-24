class Template < ApplicationRecord
  generate_public_uid

  def to_param
    public_uid
  end
  # has_many :projects
  belongs_to :user


end
