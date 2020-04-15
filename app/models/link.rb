class Link < ApplicationRecord
	belongs_to :source
  	has_many :clicks
  	has_and_belongs_to_many :entries
  	has_and_belongs_to_many :study_sets
end
