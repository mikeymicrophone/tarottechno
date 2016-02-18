require 'rails_helper'

RSpec.describe "traditions/show", type: :view do
  before(:each) do
    @tradition = assign(:tradition, Tradition.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
