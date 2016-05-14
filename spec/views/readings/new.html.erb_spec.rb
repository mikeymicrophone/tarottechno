require 'rails_helper'

RSpec.describe "readings/new", type: :view do
  before(:each) do
    assign(:reading, Reading.new(
      :event => nil,
      :reader => nil,
      :subject_id => 1
    ))
  end

  it "renders new reading form" do
    render

    assert_select "form[action=?][method=?]", readings_path, "post" do

      assert_select "input#reading_event_id[name=?]", "reading[event_id]"

      assert_select "input#reading_reader_id[name=?]", "reading[reader_id]"

      assert_select "input#reading_subject_id[name=?]", "reading[subject_id]"
    end
  end
end
