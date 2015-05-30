class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :products
  validates :name, presence: true, uniqueness: true

  # def self.order(order)
  #   if order
  #     order = order.to_s.upcase
  #     self.order(:name)
  #   else
  #     # self.order(name: :desc)
  #     self.all
  #   end
  # end

end
