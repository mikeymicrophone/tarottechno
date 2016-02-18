require 'rails_helper'

RSpec.describe "interpretations/show", type: :view do
  before(:each) do
    @interpretation = assign(:interpretation, Interpretation.create!(
      :card => nil,
      :phrase => "Phrase",
      :description => "MyText",
      :reader => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Phrase/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
