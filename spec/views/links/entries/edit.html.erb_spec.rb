require 'rails_helper'

RSpec.describe "entries/edit", type: :view do
  before(:each) do
    @entry = assign(:entry, Entry.create!(
      :word => "MyString",
      :reading => "MyString",
      :def => "MyString",
      :priority => false
    ))
  end

  it "renders the edit entry form" do
    render

    assert_select "form[action=?][method=?]", entry_path(@entry), "post" do

      assert_select "input[name=?]", "entry[word]"

      assert_select "input[name=?]", "entry[reading]"

      assert_select "input[name=?]", "entry[def]"

      assert_select "input[name=?]", "entry[priority]"
    end
  end
end
