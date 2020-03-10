class Link < ApplicationRecord
  require 'open-uri'
	belongs_to :source
  has_many :clicks
  has_and_belongs_to_many :entries
  
  def self.news
    Source.all.each do |source|
    	xml = HTTParty.get(source.url).body
      	Feedjira.parse(xml).entries.each do |article|
      		Link.where(url: article.url).first_or_create({ title: article.title, pubdate: article.published, url: article.url, descrip: "", image: "", source_id: source.id })
          html = Nokogiri::HTML(open(article.url))
          article_html = html.css('p.nTxt1')
          puts article.title
          if article_html.empty?
            article_html = html.css('div.FoldedTxtAreaPhotoArticle')
            puts "Using photo"
          end
          article_text = Loofah.fragment(article_html.to_s)
          article_words = Kuromoji::Core.new.tokenize(article_text.text)
          last_word = ""
          article_words.each do |base_word, word_data|
            word_array = word_data.split(',')
            last_word = word_array[6]
          end
          puts last_word
      	end
    end

    # rss = RSS::Parser.parse(open )
  end

end
