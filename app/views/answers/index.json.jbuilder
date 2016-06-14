json.array!(@answers) do |answer|
  json.extract! answer, :id, :content, :userID, :voteRating
  json.url answer_url(answer, format: :json)
end
