require 'rails_helper'

RSpec.describe "positions/edit", type: :view do
  before(:each) do
    @position = assign(:position, Position.create!(
      :spread => nil,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit position form" do
    render

    assert_select "form[action=?][method=?]", position_path(@position), "post" do

      assert_select "input#position_spread_id[name=?]", "position[spread_id]"

      assert_select "input#position_name[name=?]", "position[name]"

      assert_select "textarea#position_description[name=?]", "position[description]"
    end
  end
end
