require 'rails_helper'

RSpec.describe "places/edit", type: :view do
  before(:each) do
    @place = assign(:place, Place.create!(
      :line => nil,
      :querent => nil,
      :ordering => 1,
      :complete => false
    ))
  end

  it "renders the edit place form" do
    render

    assert_select "form[action=?][method=?]", place_path(@place), "post" do

      assert_select "input#place_line_id[name=?]", "place[line_id]"

      assert_select "input#place_querent_id[name=?]", "place[querent_id]"

      assert_select "input#place_ordering[name=?]", "place[ordering]"

      assert_select "input#place_complete[name=?]", "place[complete]"
    end
  end
end
