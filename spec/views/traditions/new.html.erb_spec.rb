require 'rails_helper'

RSpec.describe "traditions/new", type: :view do
  before(:each) do
    assign(:tradition, Tradition.new(
      :name => "MyString"
    ))
  end

  it "renders new tradition form" do
    render

    assert_select "form[action=?][method=?]", traditions_path, "post" do

      assert_select "input#tradition_name[name=?]", "tradition[name]"
    end
  end
end
