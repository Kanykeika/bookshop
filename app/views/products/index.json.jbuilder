json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :year, :author, :papers_count, :format, :description, :image_url
  json.url product_url(product, format: :json)
end
