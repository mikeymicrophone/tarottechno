require 'rails_helper'

RSpec.describe "suits/new", type: :view do
  before(:each) do
    assign(:suit, Suit.new(
      :name => "MyString",
      :symbol => "MyString"
    ))
  end

  it "renders new suit form" do
    render

    assert_select "form[action=?][method=?]", suits_path, "post" do

      assert_select "input#suit_name[name=?]", "suit[name]"

      assert_select "input#suit_symbol[name=?]", "suit[symbol]"
    end
  end
end
