class Link < ApplicationRecord
	belongs_to :source

  def news
    Source.all.each do |source|
    	xml = HTTParty.get(source.url).body
    	puts source.url
      	Feedjira.parse(xml).entries.each do |entry|
      		puts entry.published
      		Link.where(url: entry.url).first_or_create({ title: entry.title, pubdate: entry.published, url: entry.url, descrip: "", image: "", source_id: source.id })
      	end
    end

    # rss = RSS::Parser.parse(open )
  end

end
