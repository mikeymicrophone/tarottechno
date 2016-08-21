require 'rails_helper'

RSpec.describe "lines/edit", type: :view do
  before(:each) do
    @line = assign(:line, Line.create!(
      :event => nil,
      :reader => nil
    ))
  end

  it "renders the edit line form" do
    render

    assert_select "form[action=?][method=?]", line_path(@line), "post" do

      assert_select "input#line_event_id[name=?]", "line[event_id]"

      assert_select "input#line_reader_id[name=?]", "line[reader_id]"
    end
  end
end
