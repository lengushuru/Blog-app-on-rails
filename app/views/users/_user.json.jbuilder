json.extract! user, :id, :name, :photo, :bio, :UpdatedAt, :CreatedAt, :PostCounter, :created_at, :updated_at
json.url user_url(user, format: :json)
