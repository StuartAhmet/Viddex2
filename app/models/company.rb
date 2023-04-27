class Company < ApplicationRecord
  has_many :users
  has_one_attached :image

end
