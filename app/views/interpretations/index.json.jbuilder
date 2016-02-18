json.array!(@interpretations) do |interpretation|
  json.extract! interpretation, :id, :card_id, :phrase, :description, :reader_id
  json.url interpretation_url(interpretation, format: :json)
end
