require 'rails_helper'

RSpec.describe "interpretations/new", type: :view do
  before(:each) do
    assign(:interpretation, Interpretation.new(
      :card => nil,
      :phrase => "MyString",
      :description => "MyText",
      :reader => nil
    ))
  end

  it "renders new interpretation form" do
    render

    assert_select "form[action=?][method=?]", interpretations_path, "post" do

      assert_select "input#interpretation_card_id[name=?]", "interpretation[card_id]"

      assert_select "input#interpretation_phrase[name=?]", "interpretation[phrase]"

      assert_select "textarea#interpretation_description[name=?]", "interpretation[description]"

      assert_select "input#interpretation_reader_id[name=?]", "interpretation[reader_id]"
    end
  end
end
