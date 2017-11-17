json.extract! comment, :id, :rating, :message, :created_at, :updated_at
json.url comment_url(comment, format: :json)
