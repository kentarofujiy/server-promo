json.extract! news, :id, :title, :body, :avatar, :created_at, :updated_at
json.url news_url(news, format: :json)