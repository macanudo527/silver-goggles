class Click < ApplicationRecord
	belongs_to :link
	after_initialize :init
		
	def init
		self.click_count ||= 1
	end
	
end
