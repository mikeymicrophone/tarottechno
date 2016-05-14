json.array!(@readings) do |reading|
  json.extract! reading, :id, :event_id, :reader_id, :subject_id
  json.url reading_url(reading, format: :json)
end
