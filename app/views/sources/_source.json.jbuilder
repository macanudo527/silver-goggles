json.extract! source, :id, :title, :url, :descrip, :created_at, :updated_at
json.url source_url(source, format: :json)
