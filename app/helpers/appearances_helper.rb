module AppearancesHelper
  def extra_card_for reading
    form_for reading.appearances.new, :remote => true do |appearance_form|
      appearance_form.text_area(:description, :placeholder => 'what is this card for') +
      appearance_form.select(:card_id, options_from_collection_for_select(reading.deck.cards.sequenced, :id, :name), :include_blank => true) +
      appearance_form.check_box(:reversed) +
      appearance_form.label(:reversed, '(reversed)', :class => 'reversal') +
      appearance_form.submit('save') +
      appearance_form.hidden_field(:reading_id, :value => reading.id)
    end
  end
end
