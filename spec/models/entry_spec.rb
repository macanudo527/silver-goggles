require 'rails_helper'

RSpec.describe Entry, type: :model do
	describe "Associations" do
		it { should have_and_belong_to_many(:links) }
		it { should have_and_belong_to_many(:study_sets) }
	end
	describe "Validations" do 
		it { should validate_presence_of(:base_word) }
		it { should validate_presence_of(:word) }
		it { should validate_presence_of(:reading) }
		it { should validate_presence_of(:definition) }
	end
end
