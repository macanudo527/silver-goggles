require 'rails_helper'

RSpec.describe "study_sets/new", type: :view do
  before(:each) do
    assign(:study_set, StudySet.new(
      :user_id => 1,
      :link_id => 1
    ))
  end

  it "renders new study_set form" do
    render

    assert_select "form[action=?][method=?]", study_sets_path, "post" do

      assert_select "input[name=?]", "study_set[user_id]"

      assert_select "input[name=?]", "study_set[link_id]"
    end
  end
end
