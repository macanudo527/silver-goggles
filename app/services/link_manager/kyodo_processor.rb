require 'open-uri'

module LinkManager

	class KyodoProcessor < ApplicationService

		@SOURCE_URL = "https://this.kiji.is/-/feed/posts/rss"
		@SOURCE_ID = Source.where(title: 'Kyodo').first.id
		@SOURCE_CSS = "div.main__articleBody"
		@PAGER_CSS = nil

    end
end