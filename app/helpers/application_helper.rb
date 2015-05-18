module ApplicationHelper

  def retrieve_categories
    @categories = Category.all
  end

  def retrieve_subcategories
    @subcategories = Subcategory.all
  end


end
