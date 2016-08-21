require 'rails_helper'

RSpec.describe "places/index", type: :view do
  before(:each) do
    assign(:places, [
      Place.create!(
        :line => nil,
        :querent => nil,
        :ordering => 2,
        :complete => false
      ),
      Place.create!(
        :line => nil,
        :querent => nil,
        :ordering => 2,
        :complete => false
      )
    ])
  end

  it "renders a list of places" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
