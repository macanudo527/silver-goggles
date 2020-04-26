require 'rails_helper'

RSpec.describe Source, type: :model do
  describe "Associations" do 
  	it { should have_many(:links) }
  end

  describe "Validations" do 
  	it { should validate_presence_of(:title) }
  	it { should validate_presence_of(:url) }
  end
end
