json.extract! post, :id, :author,foreign_key, :true, :Title, :Text, :CommentsCounter, :LikesCounter, :created_at, :updated_at
json.url post_url(post, format: :json)
