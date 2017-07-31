json.extract! photo, :id, :title, :url, :thumbnailurl, :album_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
