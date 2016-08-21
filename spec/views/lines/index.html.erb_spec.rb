require 'rails_helper'

RSpec.describe "lines/index", type: :view do
  before(:each) do
    assign(:lines, [
      Line.create!(
        :event => nil,
        :reader => nil
      ),
      Line.create!(
        :event => nil,
        :reader => nil
      )
    ])
  end

  it "renders a list of lines" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
