require 'rails_helper'

RSpec.describe StudyRecord, type: :model do
  describe "Associations" do
  	it { should belong_to(:user) }
  	it { should belong_to(:entry) }
  end
  describe "Validations" do
  	it { should validate_numericality_of(:mastery).is_greater_than_or_equal_to(0) }
  end

end
