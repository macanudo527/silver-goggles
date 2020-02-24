require 'rails_helper'

RSpec.describe "Clicks", type: :request do
  before(:each) do
    12.times { create(:link) }
    @links = Link.all
  end  

  describe "Create click" do
    it "records a click" do
      visit links_path
      click_on @links.first.title
      expect(@links.first.clicks.count).to eq(1)
    end
  end

end
