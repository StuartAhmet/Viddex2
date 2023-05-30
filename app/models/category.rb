class Category < ApplicationRecord
  belongs_to :user
  has_many :videos
  has_many :subcategories
end
