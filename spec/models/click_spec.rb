require 'rails_helper'

RSpec.describe Click, type: :model do
	describe "Associations" do
		it { should belong_to(:user).without_validating_presence }
		it { should belong_to(:link) }
	end
	describe "Validations" do 
		it { should validate_presence_of(:click_count) }		
	end

  it "has a default value of 1" do 
  	click = create(:click)

  	expect(click.click_count).to eq(1)

  end

end
