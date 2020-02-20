require 'rails_helper'

RSpec.describe "sources/index", type: :view do
  before(:each) do
    assign(:sources, [
      Source.create!(
        :title => "Title",
        :url => "Url",
        :descrip => "MyText"
      ),
      Source.create!(
        :title => "Title",
        :url => "Url",
        :descrip => "MyText"
      )
    ])
  end

  it "renders a list of sources" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
