json.array!(@events) do |event|
  json.extract! event, :id, :code, :description, :observations, :date_event
  json.url event_url(event, format: :json)
end
