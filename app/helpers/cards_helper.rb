module CardsHelper
  def card_adder_for deck
    form_for deck.cards.new do |card_form|
      card_form.text_field(:name, :placeholder => 'name') +
      card_form.select(:suit_id, options_from_collection_for_select(Suit.all, :id, :name, Suit.find_by_name("None").try(:id))) +
      card_form.submit('Add') +
      card_form.hidden_field(:deck_id, :value => deck.id)
    end
  end
end
