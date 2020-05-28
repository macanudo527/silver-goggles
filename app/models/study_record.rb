class StudyRecord < ApplicationRecord
  belongs_to :user
  belongs_to :entry
  validates :mastery, numericality: { greater_than_or_equal_to: 0 }

  	def init
		self.mastery ||= 0
	end

end
