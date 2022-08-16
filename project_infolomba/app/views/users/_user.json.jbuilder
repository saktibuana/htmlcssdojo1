json.extract! user, :id, :name, :address, :gender, :age, :created_at, :updated_at
json.url user_url(user, format: :json)
