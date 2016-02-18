require 'rails_helper'

RSpec.describe "traditions/index", type: :view do
  before(:each) do
    assign(:traditions, [
      Tradition.create!(
        :name => "Name"
      ),
      Tradition.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of traditions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
