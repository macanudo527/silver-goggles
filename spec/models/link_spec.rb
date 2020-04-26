require 'rails_helper'

RSpec.describe Link, type: :model do
	let(:source) { create(:source) }
	describe "Associations" do 
		it { should belong_to(:source) } 
		it { should have_many(:clicks) }
		it { should have_many(:users) }
		it { should have_many(:study_sets) }
		it { should have_and_belong_to_many(:entries) }
	end
	describe "Validations" do
		it { should validate_presence_of(:title) }
		it "is not valid without a valid url" do
			link = Link.new(source: source, title: "Title", url: "xcdf")
			expect(link).to_not be_valid
		end
	end
end
