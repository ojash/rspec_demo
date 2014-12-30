json.array!(@photos) do |photo|
  json.extract! photo, :id, :user_id, :description, :path
  json.url photo_url(photo, format: :json)
end
