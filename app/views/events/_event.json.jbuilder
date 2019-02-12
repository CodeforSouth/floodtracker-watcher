json.extract! event, :id, :event, :data, :coreid, :published_at, :created_at, :updated_at
json.url event_url(event, format: :json)
