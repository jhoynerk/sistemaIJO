json.array!(@resources) do |resource|
  json.extract! resource, :id, :code, :name, :description, :capacity, :resource_id
  json.url resource_url(resource, format: :json)
end
