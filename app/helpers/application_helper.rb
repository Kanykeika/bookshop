module ApplicationHelper

  def retrieve_categories
    @categories = Category.all
  end

  def retrieve_order_item
    @order_item = current_order.order_items.new
  end

end
