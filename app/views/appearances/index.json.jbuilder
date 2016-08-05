json.array!(@appearances) do |appearance|
  json.extract! appearance, :id, :reading_id, :card_id, :position_id, :description
  json.url appearance_url(appearance, format: :json)
end
