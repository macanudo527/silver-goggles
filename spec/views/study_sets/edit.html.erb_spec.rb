require 'rails_helper'

RSpec.describe "study_sets/edit", type: :view do
  before(:each) do
    @study_set = assign(:study_set, StudySet.create!(
      :user_id => 1,
      :link_id => 1
    ))
  end

  it "renders the edit study_set form" do
    render

    assert_select "form[action=?][method=?]", study_set_path(@study_set), "post" do

      assert_select "input[name=?]", "study_set[user_id]"

      assert_select "input[name=?]", "study_set[link_id]"
    end
  end
end
