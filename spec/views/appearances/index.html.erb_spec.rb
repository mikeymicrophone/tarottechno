require 'rails_helper'

RSpec.describe "appearances/index", type: :view do
  before(:each) do
    assign(:appearances, [
      Appearance.create!(
        :reading => nil,
        :card => nil,
        :position => nil,
        :description => "MyText"
      ),
      Appearance.create!(
        :reading => nil,
        :card => nil,
        :position => nil,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of appearances" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
