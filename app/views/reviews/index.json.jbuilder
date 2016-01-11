json.array!(@reviews) do |review|
  json.extract! review, :id, :user_id, :ailment_id, :product_id, :method, :amount, :effectiveness, :positives, :negatives, :additional_info
  json.url review_url(review, format: :json)
end
