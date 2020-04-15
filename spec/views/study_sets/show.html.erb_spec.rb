require 'rails_helper'

RSpec.describe "study_sets/show", type: :view do
  before(:each) do
    @study_set = assign(:study_set, StudySet.create!(
      :user_id => 2,
      :link_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
