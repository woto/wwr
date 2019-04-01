json.extract! feed, :id, :category, :media, :title, :description, :pub_date, :guid, :link, :created_at, :updated_at
json.url feed_url(feed, format: :json)
