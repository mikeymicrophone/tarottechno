require 'rails_helper'

RSpec.describe "suits/show", type: :view do
  before(:each) do
    @suit = assign(:suit, Suit.create!(
      :name => "Name",
      :symbol => "Symbol"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Symbol/)
  end
end
