require 'rails_helper'

RSpec.describe "Links" do

  before(:all) { 

      # Stub the Mainichi feed, includes one duplicate entry
      mainichi_feed = File.read(Rails.root + "spec/services/link_manager/samples/mainichi-flash.rss")
      stub_request(:get, "https://mainichi.jp/rss/etc/mainichi-flash.rss").
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: mainichi_feed, headers: {})  

      # stub normal Mainichi post
      mainichi_post = File.read(Rails.root + "spec/services/link_manager/samples/mainichi-article.html")
      stub_request(:get, "https://mainichi.jp/ama-baseball/articles/20201129/k00/00m/050/119000c").
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: mainichi_post, headers: {})

  	LinkManager::MainichiProcessor.call
  }

  describe "save links from rss" do
  	it "saves the links to the database from the rss" do
  		expect(Link.first.title).to eq("ホンダ熊本追いつく　JR東日本から山本卓がソロアーチ　都市対抗")
  		expect(Link.first.url).to eq("https://mainichi.jp/ama-baseball/articles/20201129/k00/00m/050/119000c")
  		expect(Link.first.pubdate).to eq("2020-11-29 06:09:08")
  	end
    it "updates links if there is a new one" do
      	expect(Link.all.count).to eq(1)
    end
    it "links word in the dictionary to the article" do
    	expect(Link.first.entries.count).to be > 0
    end
  end
end
