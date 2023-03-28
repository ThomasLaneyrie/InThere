json.extract! comment, :id, :title, :content, :note, :created_at, :updated_at
json.url comment_url(comment, format: :json)
