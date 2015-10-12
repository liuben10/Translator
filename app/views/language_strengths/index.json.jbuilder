json.array!(@language_strengths) do |language_strength|
  json.extract! language_strength, :id, :name, :strength, :user_id
  json.url language_strength_url(language_strength, format: :json)
end
