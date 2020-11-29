require 'open-uri'

module LinkManager

	class MainichiProcessor < ApplicationService

		@SOURCE_URL = "https://mainichi.jp/rss/etc/mainichi-flash.rss"
		@SOURCE_ID = Source.where(title: 'Mainichi').first.id
		@SOURCE_CSS = "div.main-text"
		@PAGER_CSS = nil

    end
end