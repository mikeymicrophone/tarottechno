require 'rails_helper'

RSpec.describe "positions/index", type: :view do
  before(:each) do
    assign(:positions, [
      Position.create!(
        :spread => nil,
        :name => "Name",
        :description => "MyText"
      ),
      Position.create!(
        :spread => nil,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of positions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
