require 'rails_helper'

RSpec.describe "answers/new", type: :view do
  before(:each) do
    assign(:answer, Answer.new(
      :user => nil,
      :entry => nil,
      :correct => false
    ))
  end

  it "renders new answer form" do
    render

    assert_select "form[action=?][method=?]", answers_path, "post" do

      assert_select "input[name=?]", "answer[user_id]"

      assert_select "input[name=?]", "answer[entry_id]"

      assert_select "input[name=?]", "answer[correct]"
    end
  end
end
