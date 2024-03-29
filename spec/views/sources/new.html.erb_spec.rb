require 'rails_helper'

RSpec.describe "sources/new", type: :view do
  before(:each) do
    assign(:source, Source.new(
      :title => "MyString",
      :url => "MyString",
      :descrip => "MyText"
    ))
  end

  it "renders new source form" do
    render

    assert_select "form[action=?][method=?]", sources_path, "post" do

      assert_select "input[name=?]", "source[title]"

      assert_select "input[name=?]", "source[url]"

      assert_select "textarea[name=?]", "source[descrip]"
    end
  end
end
