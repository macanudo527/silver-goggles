require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Associations" do 
  	it { should have_many(:clicks) }
  	it { should have_many(:links) }
  	it { should have_many(:study_sets) }	
  end
end
