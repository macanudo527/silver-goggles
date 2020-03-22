module LinkManager

	class AeraProcessor < ApplicationService

		SOURCE_URL = "https://dot.asahi.com/rss/allnew.rss"
		SOURCE_ID = Source.where(title: 'Aera dot').first.id
		SOURCE_CSS = ["p.nTxt1", "div.FoldedTxtAreaPhotoArticle"]

		def call

	      	# Grab the rss feed from the source
	    	xml = HTTParty.get(SOURCE_URL).body

	        # Parse each entry of the rss into separate articles
	      	Feedjira.parse(xml).entries.each do |article|

				# Only create new link in the if it is unique
				# By using first_or_initialize, we can test to see if it is a new record and do further processing,
				# if it's an old record we want to skip that.
	      		link = Link.where(url: article.url).first_or_initialize({ title: article.title, pubdate: article.published, 
	            url: article.url, descrip: "", image: "", source_id: SOURCE_ID })


	          
				# Do more processing if this is new
				if link.new_record?

					# grab the whole html file
					html = Nokogiri::HTML(URI.open(article.url))

					article_html = ""

					SOURCE_CSS.each do |container|
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



		def parser(source)
 
        end
    end
end