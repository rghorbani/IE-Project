json.array!(@news) do |news|
  json.extract! news, :id, :user_id, :title, :content
  json.url news_url(news, format: :json)
end
