require 'rails_helper'

RSpec.describe "spreads/new", type: :view do
  before(:each) do
    assign(:spread, Spread.new(
      :tradition => nil,
      :description => "MyText"
    ))
  end

  it "renders new spread form" do
    render

    assert_select "form[action=?][method=?]", spreads_path, "post" do

      assert_select "input#spread_tradition_id[name=?]", "spread[tradition_id]"

      assert_select "textarea#spread_description[name=?]", "spread[description]"
    end
  end
end
