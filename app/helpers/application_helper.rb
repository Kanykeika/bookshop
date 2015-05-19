module ApplicationHelper

  def retrieve_categories
    @categories = Category.all
  end


end
