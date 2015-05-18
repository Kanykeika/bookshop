class Order < ActiveRecord::Base
  serialize :products_hash
  belongs_to :user
end
