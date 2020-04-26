class Link < ApplicationRecord
	belongs_to :source
  	has_many :clicks
  	has_many :users, through: :clicks
  	has_many :study_sets
  	has_and_belongs_to_many :entries
  	validates_presence_of :title
  	validates :url, url: { schemes: ['https', 'http'] }
end
