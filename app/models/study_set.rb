class StudySet < ApplicationRecord
	belongs_to :user
	belongs_to :link
	has_and_belongs_to_many :entries
	has_many :study_records, through: :entries
end
