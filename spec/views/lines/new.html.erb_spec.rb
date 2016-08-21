require 'rails_helper'

RSpec.describe "lines/new", type: :view do
  before(:each) do
    assign(:line, Line.new(
      :event => nil,
      :reader => nil
    ))
  end

  it "renders new line form" do
    render

    assert_select "form[action=?][method=?]", lines_path, "post" do

      assert_select "input#line_event_id[name=?]", "line[event_id]"

      assert_select "input#line_reader_id[name=?]", "line[reader_id]"
    end
  end
end
