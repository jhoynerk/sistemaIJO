json.array!(@areas) do |area|
  json.extract! area, :id, :code, :name, :institute_id
  json.url area_url(area, format: :json)
end
