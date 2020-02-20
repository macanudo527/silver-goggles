require 'rails_helper'

RSpec.describe "links/index", type: :view do
  before(:each) do
    12.times { create(:link) }
    @links = Link.all
  end

  it "renders a list of links" do
    render
    expect(render).to have_css('h4', text: Link.first.title)
    expect(render).to have_xpath('//*[@class="pop-col"]/h4', count: 12)
    expect(render).to have_link('', Link.first.url)
    expect(render).to have_css('.pop-col', count:3)
  end
end
