require 'rails_helper'

RSpec.describe "study_records/index", type: :view do
  before(:each) do
    assign(:study_records, [
      StudyRecord.create!(
        :user => nil,
        :entry => nil,
        :mastery => 2
      ),
      StudyRecord.create!(
        :user => nil,
        :entry => nil,
        :mastery => 2
      )
    ])
  end

  it "renders a list of study_records" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
