require 'rails_helper'

RSpec.describe "study_records/show", type: :view do
  before(:each) do
    @study_record = assign(:study_record, StudyRecord.create!(
      :user => nil,
      :entry => nil,
      :mastery => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
