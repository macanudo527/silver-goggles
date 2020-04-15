require 'rails_helper'

RSpec.describe "study_sets/index", type: :view do
  before(:each) do
    assign(:study_sets, [
      StudySet.create!(
        :user_id => 2,
        :link_id => 3
      ),
      StudySet.create!(
        :user_id => 2,
        :link_id => 3
      )
    ])
  end

  it "renders a list of study_sets" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
