require 'rails_helper'

RSpec.describe "spreads/index", type: :view do
  before(:each) do
    assign(:spreads, [
      Spread.create!(
        :tradition => nil,
        :description => "MyText"
      ),
      Spread.create!(
        :tradition => nil,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of spreads" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
