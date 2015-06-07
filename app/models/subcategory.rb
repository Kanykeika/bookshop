class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :products
  validates :name, presence: true, uniqueness: true

  def self.my_sort(sort_attr)
    if sort_attr
      sort_attr = sort_attr.to_s.downcase
      self.order('? ASC', "#{sort_attr}")
    else
      # self.order('? DESC', "#{sort_attr}")
      self.all
    end
  end

end
