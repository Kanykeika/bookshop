class Basket < ActiveRecord::Base
  belongs_to :user
  has_one :product
end