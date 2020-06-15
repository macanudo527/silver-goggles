class StudyRecord < ApplicationRecord
  belongs_to :user
  belongs_to :entry
 # has_many :study_sets, through: :entries
  validates :mastery, numericality: { greater_than_or_equal_to: 0 }
  validates_uniqueness_of :entry_id, scope: :user_id

  	def init
		self.mastery ||= 0
	end

	def mastery_up
		self.mastery += 1
		case self.mastery
			when 1
				self.due = Time.now + 1.days
			when 2
				self.due = Time.now + 1.weeks
			when 3
				self.due = Time.now + 16.days
			when 4
				self.due = Time.now + 35.days
			when 5
				self.due = Time.now + 74.days
			when 6
				self.due = Time.now + 152.days
			when 7..Float::INFINITY
				self.due = Time.now + 1.years
		end
	end

	def missed
		self.mastery = 0
		self.due = Time.now + 6.hours
	end

end
