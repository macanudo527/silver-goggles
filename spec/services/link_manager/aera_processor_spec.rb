require 'rails_helper'

RSpec.describe "Links" do

  before(:all) { 

      # Stub the Aera feed, includes one duplicate entry
      aera_feed = File.read(Rails.root + "spec/services/link_manager/samples/aera-rss.rss")
      stub_request(:get, "https://dot.asahi.com/rss/allnew.rss").
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: aera_feed, headers: {})  

      # stub 'normal' Aera post
      aera_nTxt_post = File.read(Rails.root + "spec/services/link_manager/samples/aera-nTxt1.html")
      stub_request(:get, "https://dot.asahi.com/aera/2020021400053.html").
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: aera_nTxt_post, headers: {})

      aera_nTxt_post = File.read(Rails.root + "spec/services/link_manager/samples/aera-nTxt1-page2.html")
      stub_request(:get, "https://dot.asahi.com/aera/2020021400053.html?page=2").
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: aera_nTxt_post, headers: {})

      aera_nTxt_post = File.read(Rails.root + "spec/services/link_manager/samples/aera-nTxt1-page3.html")
      stub_request(:get, "https://dot.asahi.com/aera/2020021400053.html?page=3").
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: aera_nTxt_post, headers: {})

      # stub 'photo' Aera post	
      aera_photo_post = File.read(Rails.root + "spec/services/link_manager/samples/aera-photoarticle.html")
      stub_request(:get, "https://dot.asahi.com/aera/photoarticle/2020030800014.html").
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: aera_photo_post, headers: {})   

      aera_photo_post = File.read(Rails.root + "spec/services/link_manager/samples/aera-photoarticle-page2.html")
      stub_request(:get, "https://dot.asahi.com/aera/photoarticle/2020030800014.html?page=2").
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: aera_photo_post, headers: {})   

      aera_photo_post = File.read(Rails.root + "spec/services/link_manager/samples/aera-photoarticle-page3.html")
      stub_request(:get, "https://dot.asahi.com/aera/photoarticle/2020030800014.html?page=3").
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: aera_photo_post, headers: {}) 

  	LinkManager::AeraProcessor.call
  }

  describe "save links from rss" do
  	it "saves the links to the database from the rss" do
  		expect(Link.first.title).to eq("バイデン氏は記者も驚く“衰え”ぶり。躍進のブダジェッジ氏も歓声はトランプ氏の3分の1")
  		expect(Link.first.url).to eq("https://dot.asahi.com/aera/2020021400053.html")
  		expect(Link.first.pubdate).to eq("2020-02-16 14:00:00")
  	end
    it "updates links if there is a new one" do
      	expect(Link.all.count).to eq(2)
    end
    it "links word in the dictionary to the article" do
    	expect(Link.first.entries.count).to be > 0
    end
  end
end
