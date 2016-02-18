require 'rails_helper'

RSpec.describe "decks/new", type: :view do
  before(:each) do
    assign(:deck, Deck.new(
      :tradition => nil,
      :name => "MyString"
    ))
  end

  it "renders new deck form" do
    render

    assert_select "form[action=?][method=?]", decks_path, "post" do

      assert_select "input#deck_tradition_id[name=?]", "deck[tradition_id]"

      assert_select "input#deck_name[name=?]", "deck[name]"
    end
  end
end
