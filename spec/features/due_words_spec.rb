require 'rails_helper'

RSpec.describe "User can see a list of articles they read" do
  let(:user) { create(:user) }
  let!(:link) { create(:link_with_entries) }

  let!(:click) { link.clicks.create(user: user) }
  let(:study_set) { StudySet.create(user: user, link: link) }

  scenario "with 5 words due" do

  	# Choose words to study
  	study_set.entries << link.entries

  	sign_in user
  	visit user_path(user)

  	expect(page).to have_content("5 words due")

  end

end