require 'rails_helper'

RSpec.describe "spreads/show", type: :view do
  before(:each) do
    @spread = assign(:spread, Spread.create!(
      :tradition => nil,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
