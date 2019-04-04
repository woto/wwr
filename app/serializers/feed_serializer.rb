class FeedSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :category, :media, :title, :description, :pub_date, :guid, :link, :created_at, :updated_at
end
