json.array!(@suits) do |suit|
  json.extract! suit, :id, :name, :symbol
  json.url suit_url(suit, format: :json)
end
