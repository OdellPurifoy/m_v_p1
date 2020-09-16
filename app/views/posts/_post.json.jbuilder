json.extract! post, :id, :title, :content, :category, :belongs_to, :created_at, :updated_at
json.url post_url(post, format: :json)
