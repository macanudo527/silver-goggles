require 'rails_helper'

RSpec.describe "links/new", type: :view do
  before(:each) do
    assign(:link, Link.new(
      :title => "MyString",
      :url => "MyString",
      :descrip => "MyText",
      :image => "MyText"
    ))
  end

  it "renders new link form" do
    render

    assert_select "form[action=?][method=?]", links_path, "post" do

      assert_select "input[name=?]", "link[title]"

      assert_select "input[name=?]", "link[url]"

      assert_select "textarea[name=?]", "link[descrip]"

      assert_select "textarea[name=?]", "link[image]"
    end
  end
end
