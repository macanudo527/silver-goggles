class Click < ApplicationRecord
	belongs_to :link
	belongs_to :user, optional: true
	after_initialize :init
		
	def init
		self.click_count ||= 1
	end
	
end
