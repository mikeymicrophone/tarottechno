module InterpretationsHelper
  def appearance_interpretation_form appearance
    form_for appearance.interpretations.new, :remote => true, :html => {:id => dom_id(appearance, :interpretation_of)} do |interpretation_form|
      interpretation_form.text_field(:phrase, :placeholder => 'phrase') +
      interpretation_form.text_area(:description, :placeholder => 'explanation') +
      interpretation_form.submit('enter interpretation') +
      interpretation_form.hidden_field(:appearance_id, :value => appearance.id) +
      interpretation_form.hidden_field(:card_id, :value => appearance.card_id) +
      interpretation_form.hidden_field(:reader_id, :value => appearance.reader.id)
    end
  end
  
  def interpretation_display interpretation
    content_tag_for(:header, interpretation) do
      interpretation.phrase
    end +
    div_for(interpretation) do
      interpretation.description
    end
  end
end
