json.array!(@activities) do |activity|
  json.extract! activity, :id, :code, :description, :date_start, :date_end, :event_id
  json.url activity_url(activity, format: :json)
end
