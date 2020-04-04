require 'rails_helper'

RSpec.describe "entries/new", type: :view do
  before(:each) do
    assign(:entry, Entry.new(
      :word => "MyString",
      :reading => "MyString",
      :def => "MyString",
      :priority => false
    ))
  end

  it "renders new entry form" do
    render

    assert_select "form[action=?][method=?]", entries_path, "post" do

      assert_select "input[name=?]", "entry[word]"

      assert_select "input[name=?]", "entry[reading]"

      assert_select "input[name=?]", "entry[def]"

      assert_select "input[name=?]", "entry[priority]"
    end
  end
end
