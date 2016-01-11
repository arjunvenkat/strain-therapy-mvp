json.array!(@user_ailments) do |user_ailment|
  json.extract! user_ailment, :id, :user_id, :ailment_id
  json.url user_ailment_url(user_ailment, format: :json)
end
