require 'rails_helper'

RSpec.describe "Links" do

  before(:all) { 

      # Stub the Kyodo feed, includes one duplicate entry
      kyodo_feed = File.read(Rails.root + "spec/services/link_manager/samples/kyodo-rss.xml")
      stub_request(:get, "https://this.kiji.is/-/feed/posts/rss").
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: kyodo_feed, headers: {})  

      # stub 'normal' Kyodo post
      kyodo_post = File.read(Rails.root + "spec/services/link_manager/samples/kyodo-article.html")
      stub_request(:get, "https://this.kiji.is/704848404068549729").
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: kyodo_post, headers: {})

  	LinkManager::KyodoProcessor.call
  }

  describe "save links from rss" do
  	it "saves the links to the database from the rss" do
  		expect(Link.first.title).to eq("【毎日がアプリディ】ギャルを指導していい大学に合格させよう「けいおうギャル」")
  		expect(Link.first.url).to eq("https://this.kiji.is/704848404068549729")
  		expect(Link.first.pubdate).to eq("2020-11-27 00:15:54")
  	end
    it "updates links if there is a new one" do
      	expect(Link.all.count).to eq(1)
    end
    it "links word in the dictionary to the article" do
    	expect(Link.first.entries.count).to be > 0
    end
  end
end
