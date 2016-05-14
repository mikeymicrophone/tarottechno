require 'rails_helper'

RSpec.describe "spreads/edit", type: :view do
  before(:each) do
    @spread = assign(:spread, Spread.create!(
      :tradition => nil,
      :description => "MyText"
    ))
  end

  it "renders the edit spread form" do
    render

    assert_select "form[action=?][method=?]", spread_path(@spread), "post" do

      assert_select "input#spread_tradition_id[name=?]", "spread[tradition_id]"

      assert_select "textarea#spread_description[name=?]", "spread[description]"
    end
  end
end
