require 'rails_helper'

RSpec.describe "appearances/show", type: :view do
  before(:each) do
    @appearance = assign(:appearance, Appearance.create!(
      :reading => nil,
      :card => nil,
      :position => nil,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
