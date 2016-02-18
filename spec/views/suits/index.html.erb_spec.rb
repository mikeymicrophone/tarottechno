require 'rails_helper'

RSpec.describe "suits/index", type: :view do
  before(:each) do
    assign(:suits, [
      Suit.create!(
        :name => "Name",
        :symbol => "Symbol"
      ),
      Suit.create!(
        :name => "Name",
        :symbol => "Symbol"
      )
    ])
  end

  it "renders a list of suits" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Symbol".to_s, :count => 2
  end
end
