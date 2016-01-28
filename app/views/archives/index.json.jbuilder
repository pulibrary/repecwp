json.array!(@archives) do |archive|
  json.extract! archive, :id, :handle, :name, :maintainer_email, :description, :url
  json.url archive_url(archive, format: :json)
end
