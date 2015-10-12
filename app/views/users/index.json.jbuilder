json.array!(@users) do |user|
  json.extract! user, :id, :name, :phone_number, :rating, :bio
  json.url user_url(user, format: :json)
end
