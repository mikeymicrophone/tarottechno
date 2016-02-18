require 'rails_helper'

RSpec.describe "cards/edit", type: :view do
  before(:each) do
    @card = assign(:card, Card.create!(
      :deck => nil,
      :name => "MyString",
      :suit => nil,
      :order => 1
    ))
  end

  it "renders the edit card form" do
    render

    assert_select "form[action=?][method=?]", card_path(@card), "post" do

      assert_select "input#card_deck_id[name=?]", "card[deck_id]"

      assert_select "input#card_name[name=?]", "card[name]"

      assert_select "input#card_suit_id[name=?]", "card[suit_id]"

      assert_select "input#card_order[name=?]", "card[order]"
    end
  end
end
