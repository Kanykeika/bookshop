class Product < ActiveRecord::Base
  has_many :order_items

  # default_scope { where(active: true) }
  belongs_to :subcategory
  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true
  validates :author,  presence: true, length: { maximum: 50 }
  validates :format,  presence: true, length: { maximum: 10 }
  validates :description,  presence: true
  validates :image_url,  presence: true, format: { with: %r{\.(gif|jpg|jpeg|png)$}i, multiline: true, message: 'must be a URL for GIF, JPG, JPEG ' + 'or PNG image.'}
  validates :price,  presence: true, numericality: true
  validate :price_at_least_fifty_soms
  validates :year,  presence: true, length: { maximum: 4 }
  validates :papers_count,  presence: true

  def self.search(search)
    if search
      search = search.to_s.upcase
      self.where("upper(name) like ? or upper(author) like ? or upper(description) like ?",
                                  "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.all
    end
    end

  def self.my_sort(sort_attr)
    if sort_attr
      sort_attr = sort_attr.to_s.downcase
      # self.order('? ASC', "#{sort_attr}").find_by(:subcategory => 5)
      self.find_by_sql("select * from products where subcategory_id = ? order by ? ASC", 5, "#{sort_attr}")
    else
      # self.order('? DESC', "#{sort_attr}")
      self.all
    end
  end


  protected
  def price_at_least_fifty_soms
    errors.add(:price, 'should be at least 50 soms' ) if price.nil? ||
        price < 50
  end

end
