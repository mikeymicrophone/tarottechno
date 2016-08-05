require 'rails_helper'

RSpec.describe "appearances/new", type: :view do
  before(:each) do
    assign(:appearance, Appearance.new(
      :reading => nil,
      :card => nil,
      :position => nil,
      :description => "MyText"
    ))
  end

  it "renders new appearance form" do
    render

    assert_select "form[action=?][method=?]", appearances_path, "post" do

      assert_select "input#appearance_reading_id[name=?]", "appearance[reading_id]"

      assert_select "input#appearance_card_id[name=?]", "appearance[card_id]"

      assert_select "input#appearance_position_id[name=?]", "appearance[position_id]"

      assert_select "textarea#appearance_description[name=?]", "appearance[description]"
    end
  end
end
