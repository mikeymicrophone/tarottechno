require 'rails_helper'

RSpec.describe "interpretations/index", type: :view do
  before(:each) do
    assign(:interpretations, [
      Interpretation.create!(
        :card => nil,
        :phrase => "Phrase",
        :description => "MyText",
        :reader => nil
      ),
      Interpretation.create!(
        :card => nil,
        :phrase => "Phrase",
        :description => "MyText",
        :reader => nil
      )
    ])
  end

  it "renders a list of interpretations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Phrase".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
