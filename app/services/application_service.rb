class ApplicationService
  def self.call(*args, &block)

      	# Grab the rss feed from the source
    	xml = HTTParty.get(@SOURCE_URL).body

        # Parse each entry of the rss into separate articles
      	Feedjira.parse(xml).entries.each do |article|

      		#Very generic test to see if the article is actually in Japanese
      		if article.title.match /\p{Hiragana}/

				# Only create new link in the if it is unique
				# By using first_or_initialize, we can test to see if it is a new record and do further processing,
				# if it's an old record we want to skip that.
	      		link = Link.where(url: article.url).first_or_initialize({ title: article.title, pubdate: article.published, 
	            url: article.url, descrip: article.summary, image: article.image, source_id: @SOURCE_ID })

				# Do more processing if this is new
				if link.new_record?

					# grab the whole html file
					html = Nokogiri::HTML(URI.open(article.url))

					article_html = ""
					article_container = ""


					# Find the css element that has the article.  Aera has two different kinds of articles.
					if @SOURCE_CSS.respond_to?('each') 
						@SOURCE_CSS.each do |container|
						    article_html = html.css(container)
						    if !article_html.empty?
						      article_container = container
						      break
						    end            
						end
					else
						article_html = html.css(@SOURCE_CSS)
					end

					# If we have to page through the article. Currently this is only Aera Dot
					if @PAGER_CSS != nil
						current_page = 2

						# Page through the rest of the article collecting words.
						while !html.css(@PAGER_CSS).empty?
							html = Nokogiri::HTML(URI.open(article.url + "?page=" + current_page.to_s))
							article_html = article_html + html.css(article_container)
							current_page = current_page + 1
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