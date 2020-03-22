class Link < ApplicationRecord
  require 'open-uri'
	belongs_to :source
  has_many :clicks
  has_and_belongs_to_many :entries
  
  def self.news

    # Cycle through each source
    Source.all.each do |source|

      # Grab the rss feed from the source
    	xml = HTTParty.get(source.url).body

        # Parse each entry of the rss into separate articles
      	Feedjira.parse(xml).entries.each do |article|

          # Only create new link in the if it is unique
          # By using first_or_initialize, we can test to see if it is a new record and do further processing,
          # if it's an old record we want to skip that.
      		link = Link.where(url: article.url).first_or_initialize({ title: article.title, pubdate: article.published, 
            url: article.url, descrip: "", image: "", source_id: source.id })
          
          # Do more processing if this is new
          if link.new_record?

            # grab the whole html file
            html = Nokogiri::HTML(URI.open(article.url))

            potential_articles = source.source_css.split(',')
            article_html = ""

            potential_articles.each do |container|
                article_html = html.css(container)
                if !article_html.empty?
                  break
                end            
            end

            article_text = Loofah.fragment(article_html.to_s)
            article_words = Kuromoji::Core.new.tokenize(article_text.text)
            article_base_words = []
            article_words.each do |base_word, word_data|

              article_base_words << word_data.split(',')[6]

            end

            link.entries << Entry.where(base_word: article_base_words)
            link.save

          end



      	end
    end
  end

end
