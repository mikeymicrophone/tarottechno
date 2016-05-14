require 'rails_helper'

RSpec.describe "readings/show", type: :view do
  before(:each) do
    @reading = assign(:reading, Reading.create!(
      :event => nil,
      :reader => nil,
      :subject_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
  end
end
