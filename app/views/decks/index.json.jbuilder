json.array!(@decks) do |deck|
  json.extract! deck, :id, :tradition_id, :name
  json.url deck_url(deck, format: :json)
end
