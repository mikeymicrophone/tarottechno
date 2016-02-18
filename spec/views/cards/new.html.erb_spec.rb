require 'rails_helper'

RSpec.describe "cards/new", type: :view do
  before(:each) do
    assign(:card, Card.new(
      :deck => nil,
      :name => "MyString",
      :suit => nil,
      :order => 1
    ))
  end

  it "renders new card form" do
    render

    assert_select "form[action=?][method=?]", cards_path, "post" do

      assert_select "input#card_deck_id[name=?]", "card[deck_id]"

      assert_select "input#card_name[name=?]", "card[name]"

      assert_select "input#card_suit_id[name=?]", "card[suit_id]"

      assert_select "input#card_order[name=?]", "card[order]"
    end
  end
end
