require 'rails_helper'

RSpec.describe "suits/edit", type: :view do
  before(:each) do
    @suit = assign(:suit, Suit.create!(
      :name => "MyString",
      :symbol => "MyString"
    ))
  end

  it "renders the edit suit form" do
    render

    assert_select "form[action=?][method=?]", suit_path(@suit), "post" do

      assert_select "input#suit_name[name=?]", "suit[name]"

      assert_select "input#suit_symbol[name=?]", "suit[symbol]"
    end
  end
end
