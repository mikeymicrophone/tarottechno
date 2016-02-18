require 'rails_helper'

RSpec.describe "decks/edit", type: :view do
  before(:each) do
    @deck = assign(:deck, Deck.create!(
      :tradition => nil,
      :name => "MyString"
    ))
  end

  it "renders the edit deck form" do
    render

    assert_select "form[action=?][method=?]", deck_path(@deck), "post" do

      assert_select "input#deck_tradition_id[name=?]", "deck[tradition_id]"

      assert_select "input#deck_name[name=?]", "deck[name]"
    end
  end
end
