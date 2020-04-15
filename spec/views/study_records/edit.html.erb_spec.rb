require 'rails_helper'

RSpec.describe "study_records/edit", type: :view do
  before(:each) do
    @study_record = assign(:study_record, StudyRecord.create!(
      :user => nil,
      :entry => nil,
      :mastery => 1
    ))
  end

  it "renders the edit study_record form" do
    render

    assert_select "form[action=?][method=?]", study_record_path(@study_record), "post" do

      assert_select "input[name=?]", "study_record[user_id]"

      assert_select "input[name=?]", "study_record[entry_id]"

      assert_select "input[name=?]", "study_record[mastery]"
    end
  end
end
