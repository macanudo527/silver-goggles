class Link < ApplicationRecord
  require 'open-uri'
	belongs_to :source
  has_many :clicks
  has_and_belongs_to_many :entries
  
  def self.news
    Source.all.each do |source|
    	xml = HTTParty.get(source.url).body
    	puts source.url
      	Feedjira.parse(xml).entries.each do |article|
      		puts entry.title
      		Link.where(url: article.url).first_or_create({ title: article.title, pubdate: article.published, url: article.url, descrip: "", image: "", source_id: source.id })
          html = Nokogiri::HTML(open(article.url))
          article_html = html.css('p.nTxt1')
          article_text = Loofah.frament(article.html.to_s)
          put article_text
          break


      	end
    end

    # rss = RSS::Parser.parse(open )
  end

end
