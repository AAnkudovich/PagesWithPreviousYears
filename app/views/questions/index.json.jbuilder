json.array!(@questions) do |question|
  json.extract! question, :id, :name, :content, :userID, :voteRating, :resolved, :viewCount, :answerCount
  json.url question_url(question, format: :json)
end
