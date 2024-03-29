require 'rails_helper'

RSpec.describe "Entries", type: :request do

  let(:user) {create(:user)}
  let(:editor) {create(:editor)}
  let(:link) {create(:link_with_entries)}
  
  describe "entries" do

    it "displays all entries for link for regular users" do
      sign_in user
      visit link_entries_path(link)
      expect(page).to have_content link.entries.first.base_word
    end

    it "shows edit form for entry for editors" do
      sign_in editor
      visit link_entries_path(link)
      find('.tab', match: :first).click
      find('.edit_entry_link', match: :first).click 
      expect(page).to have_css 'form.edit_entry'

    end

  end
end
