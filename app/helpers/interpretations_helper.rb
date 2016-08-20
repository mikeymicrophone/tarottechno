module InterpretationsHelper
  def appearance_interpretation_form appearance
    form_for appearance.interpretations.new, :remote => true, :html => {:id => dom_id(appearance, :interpretation_of)} do |interpretation_form|
      interpretation_form.text_field(:phrase) +
      interpretation_form.text_area(:description) +
      interpretation_form.submit +
      interpretation_form.hidden_field(:appearance_id, :value => appearance.id) +
      interpretation_form.hidden_field(:card_id, :value => appearance.card_id) +
      interpretation_form.hidden_field(:reader_id, :value => appearance.reader.id)
    end
  end
end
