require 'open-uri'
module LinkManager

	class AeraProcessor < ApplicationService

		@SOURCE_URL = "https://dot.asahi.com/rss/allnew.rss"
		@SOURCE_ID = Source.where(title: 'Aera dot').first.id
		@SOURCE_CSS = ["p.nTxt1", "div.FoldedTxtAreaPhotoArticle"]
		@PAGER_CSS = "li.articlePagerNext"
		
    end
end