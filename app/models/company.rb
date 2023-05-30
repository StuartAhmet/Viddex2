class Company < ApplicationRecord

  generate_public_uid

  def to_param
    public_uid
  end

  has_many :users
  has_one_attached :image

end
