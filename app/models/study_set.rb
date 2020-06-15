class StudySet < ApplicationRecord
	belongs_to :user
	belongs_to :link
	has_and_belongs_to_many :entries, before_add: :add_study_record
	has_many :study_records, through: :entries

	def add_study_record(entry)
		StudyRecord.create(user: user, entry: entry, due: Time.now).save
		true
	end

end
