json.array!(@spreads) do |spread|
  json.extract! spread, :id, :tradition_id, :description
  json.url spread_url(spread, format: :json)
end
