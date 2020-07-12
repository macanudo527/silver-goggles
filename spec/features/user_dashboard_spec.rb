require 'rails_helper'

RSpec.describe "User clicks learn on a link" do
	let(:user) { create(:user) }
	let!(:link) { create(:link_with_entries) }

	scenario "Regular user clicks a link without choosing entries" do
		sign_in user
		visit root_path
		click_on "Learn"
		visit user_path(user)

		expect(page).to have_content("MyString")
		expect(page).to have_no_content("Review Now")

		find('#link-dropdown').hover
		expect(page).to have_selector('#link-dropdown', visible: true)
		click_on "Edit list"
		click_on "Save & Return"
		expect(page).to have_content("5 words")

		find('#link-dropdown').hover
		click_on "Delete list"
		expect(page).to have_no_content("MyString")

	end
end