require 'rails_helper'

RSpec.describe "entries/index", type: :view do
  before(:each) do
    assign(:entries, [
      Entry.create!(
        :word => "Word",
        :reading => "Reading",
        :def => "Def",
        :priority => false
      ),
      Entry.create!(
        :word => "Word",
        :reading => "Reading",
        :def => "Def",
        :priority => false
      )
    ])
  end

  it "renders a list of entries" do
    render
    assert_select "tr>td", :text => "Word".to_s, :count => 2
    assert_select "tr>td", :text => "Reading".to_s, :count => 2
    assert_select "tr>td", :text => "Def".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
