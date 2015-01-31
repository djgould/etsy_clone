json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :store_id
  json.url product_url(product, format: :json)
end
