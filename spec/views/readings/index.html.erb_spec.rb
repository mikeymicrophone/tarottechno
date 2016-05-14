require 'rails_helper'

RSpec.describe "readings/index", type: :view do
  before(:each) do
    assign(:readings, [
      Reading.create!(
        :event => nil,
        :reader => nil,
        :subject_id => 1
      ),
      Reading.create!(
        :event => nil,
        :reader => nil,
        :subject_id => 1
      )
    ])
  end

  it "renders a list of readings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
