json.array!(@dispensaries) do |dispensary|
  json.extract! dispensary, :id, :name, :description
  json.url dispensary_url(dispensary, format: :json)
end
