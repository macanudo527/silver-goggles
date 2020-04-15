class StudySet < ApplicationRecord
	belongs_to :user
	belongs_to :link
	has_and_belongs_to_many :entries
end
