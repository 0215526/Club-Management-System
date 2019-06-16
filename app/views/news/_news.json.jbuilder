json.extract! news, :id, :title, :body, :user, :created_at, :updated_at
json.url news_url(news, format: :json)
