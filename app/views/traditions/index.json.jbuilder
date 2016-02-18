json.array!(@traditions) do |tradition|
  json.extract! tradition, :id, :name
  json.url tradition_url(tradition, format: :json)
end
