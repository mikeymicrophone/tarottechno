require 'rails_helper'

RSpec.describe "traditions/edit", type: :view do
  before(:each) do
    @tradition = assign(:tradition, Tradition.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit tradition form" do
    render

    assert_select "form[action=?][method=?]", tradition_path(@tradition), "post" do

      assert_select "input#tradition_name[name=?]", "tradition[name]"
    end
  end
end
