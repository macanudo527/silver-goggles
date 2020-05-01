require 'rails_helper'

RSpec.describe StudySet, type: :model do
  describe "Associations" do 
  	it { should belong_to(:user) }
  	it { should belong_to(:link) }
  	it { should have_and_belong_to_many(:entries) }	
  end
end
