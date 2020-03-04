require 'rails_helper'

RSpec.describe "Clicks", type: :request do
  before(:each) do
    12.times { create(:link) }
    @links = Link.all
  end  

  context "When clicking on links" do
    it "records a click" do
      visit links_path
      expect(@links.first.clicks.count).to eq(0)
      click_on @links.first.title
      expect(@links.first.clicks.count).to eq(1)
    end
    it "assigns the link to the current user" do 
    	user = create(:user)
    	sign_in user
    	visit links_path
    	click_on @links.first.title
    	expect(user.clicks.count).to eq(1)
    end


  end

end
