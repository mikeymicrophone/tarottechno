require 'rails_helper'

RSpec.describe "appearances/edit", type: :view do
  before(:each) do
    @appearance = assign(:appearance, Appearance.create!(
      :reading => nil,
      :card => nil,
      :position => nil,
      :description => "MyText"
    ))
  end

  it "renders the edit appearance form" do
    render

    assert_select "form[action=?][method=?]", appearance_path(@appearance), "post" do

      assert_select "input#appearance_reading_id[name=?]", "appearance[reading_id]"

      assert_select "input#appearance_card_id[name=?]", "appearance[card_id]"

      assert_select "input#appearance_position_id[name=?]", "appearance[position_id]"

      assert_select "textarea#appearance_description[name=?]", "appearance[description]"
    end
  end
end
