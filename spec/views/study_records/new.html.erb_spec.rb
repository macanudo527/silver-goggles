require 'rails_helper'

RSpec.describe "study_records/new", type: :view do
  before(:each) do
    assign(:study_record, StudyRecord.new(
      :user => nil,
      :entry => nil,
      :mastery => 1
    ))
  end

  it "renders new study_record form" do
    render

    assert_select "form[action=?][method=?]", study_records_path, "post" do

      assert_select "input[name=?]", "study_record[user_id]"

      assert_select "input[name=?]", "study_record[entry_id]"

      assert_select "input[name=?]", "study_record[mastery]"
    end
  end
end
