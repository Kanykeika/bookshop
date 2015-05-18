json.array!(@orders) do |order|
  json.extract! order, :id, :products_hash, :comment_for_operator
  json.url order_url(order, format: :json)
end
