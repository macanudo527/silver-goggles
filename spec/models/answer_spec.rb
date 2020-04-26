require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe "Associations" do 
  	it { should belong_to(:user) }
  	it { should belong_to(:entry) }
  end
  describe "Validations" do 
    it { should validate_presence_of(:correct) }
  end
end
