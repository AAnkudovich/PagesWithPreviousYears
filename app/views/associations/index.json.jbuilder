json.array!(@associations) do |association|
  json.extract! association, :id, :pagename, :pageID
  json.url association_url(association, format: :json)
end
