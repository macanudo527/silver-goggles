class Entry < ApplicationRecord
	has_and_belongs_to_many :links
	has_and_belongs_to_many :study_sets
	validates_presence_of :base_word, :word, :reading, :definition 
end
