require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe "Associations" do 
  	it { should belong_to(:user) }
  	it { should belong_to(:entry) }
  end
  describe "Validations" do 
  	
  end
  describe "Study Record Updates" do
  	it "creates study record to the correct mastery" do
  		expect(StudyRecord.count).to eq(0)
  		subject_answer = create(:correct_answer)
  		expect(StudyRecord.count).to eq(1)
  		subject_study_record = StudyRecord.find_by(user: subject_answer.user.id, entry: subject_answer.entry.id)
  		expect(subject_study_record.mastery).to eq(1)
  		Answer.create(user_id: subject_answer.user.id, entry_id: subject_answer.entry.id, correct: true)
  		expect(Answer.count).to eq(2)
  		expect(subject_study_record.reload.mastery).to eq(2)
  	end
  end

end
