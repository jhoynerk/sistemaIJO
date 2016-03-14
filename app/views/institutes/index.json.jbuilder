json.array!(@institutes) do |institute|
  json.extract! institute, :id, :code, :name
  json.url institute_url(institute, format: :json)
end
