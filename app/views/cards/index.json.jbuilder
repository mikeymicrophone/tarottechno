json.array!(@cards) do |card|
  json.extract! card, :id, :deck_id, :name, :suit_id, :order
  json.url card_url(card, format: :json)
end
