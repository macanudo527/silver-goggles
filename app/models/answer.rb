class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :entry
  validates_inclusion_of :correct, in: [true, false]
  before_save :update_study_record

  def update_study_record
  	if correct
  		study_record = StudyRecord.find_or_create_by(:user_id => user_id, :entry_id => entry_id)
      study_record.increment!(:mastery)

  	else
  		StudyRecord.find_or_initialize_by(:user_id => user_id, :entry_id => entry_id)
    			.update(mastery: 0)
  	end
  end

end
