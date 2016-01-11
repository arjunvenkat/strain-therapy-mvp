json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :category, :thc, :cbd, :cbc, :cbn
  json.url product_url(product, format: :json)
end
