class Click < ApplicationRecord
	belongs_to :link
	belongs_to :user, optional: true
	validates_presence_of :click_count
	after_initialize :init
		
	def init
		self.click_count ||= 1
	end
	
end
