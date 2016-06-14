json.array!(@categories) do |category|
  json.extract! category, :id, :name, :parentId, :questionCount
  json.url category_url(category, format: :json)
end
