class Link < ApplicationRecord
	belongs_to :source
  	has_many :clicks
  	has_many :study_sets
  	has_and_belongs_to_many :entries
end
