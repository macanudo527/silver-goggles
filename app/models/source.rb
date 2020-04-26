class Source < ApplicationRecord
	has_many :links
	validates_presence_of :title, :url
end
