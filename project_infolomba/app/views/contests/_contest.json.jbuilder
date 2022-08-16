json.extract! contest, :id, :name, :description, :maxcontestant, :status, :created_at, :updated_at
json.url contest_url(contest, format: :json)
