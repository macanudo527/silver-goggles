class Entry < ApplicationRecord
	has_and_belongs_to_many :links
	has_and_belongs_to_many :study_sets
	has_many :study_records
	has_many :secondaries, class_name: "Entry", foreign_key: "primary_id"
	belongs_to :primary, class_name: "Entry", optional: true
	validates_presence_of :base_word, :word, :reading, :definition 
end
