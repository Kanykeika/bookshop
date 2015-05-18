class Category < ActiveRecord::Base
  # has_many :products
  has_many :subcategories
  validates :name, presence: true, uniqueness: true
end
