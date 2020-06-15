require 'rails_helper'

RSpec.describe "/links/entries/index", type: :view do
  let(:user) { create(:user) }

  before(:each) do
    assign(:entries, [create(:entry), create(:entry)])
    assign(:priority_entries, [create(:priority_entry)])
    assign(:grammar_entries, [create(:grammar_entry)])
    assign(:link, create(:link))
    assign(:study_set, create(:study_set) )

  end

  it "renders a list of entries" do
    sign_in user
    render
    assert_select "table.article-words tr>td", :text => /MyWord.*/, :count => 2
    assert_select "table.priority-words tr>td", :text => /MyPriorityWord.*/, :count => 1
    assert_select "table.grammar-words tr>td", :text => /MyGrammarWord.*/, :count => 1    
    assert_select "tr>td>span", :text => /MyReading.*/, :count => 4
    assert_select "tr>td", :text => /MyDefinition.*/, :count => 4

  end
end