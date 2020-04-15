require 'rails_helper'

RSpec.describe "answers/edit", type: :view do
  before(:each) do
    @answer = assign(:answer, Answer.create!(
      :user => nil,
      :entry => nil,
      :correct => false
    ))
  end

  it "renders the edit answer form" do
    render

    assert_select "form[action=?][method=?]", answer_path(@answer), "post" do

      assert_select "input[name=?]", "answer[user_id]"

      assert_select "input[name=?]", "answer[entry_id]"

      assert_select "input[name=?]", "answer[correct]"
    end
  end
end
