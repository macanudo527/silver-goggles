require 'rails_helper'

RSpec.describe "User clicks learn on a link" do
  let(:user) { create(:user) }
  let(:editor) { create(:editor) }
  let!(:link) { create(:link_with_entries) }

  scenario "Regular user takes the quiz" do

  	sign_in user
  	visit root_path
  	click_on "Learn"

  	# Check whether the app saves the state of the checkboxes
  	checked_id = first("input[type='checkbox']").uncheck[:id]
  	click_on "Learn & Read"
  	page.go_back
  	expect(page).to have_unchecked_field("#{checked_id}")
  	click_on "Learn & Read"

  	# Check word shown on card is one of the words being tested over
  	studied_words = link.entries.pluck(:base_word)
  	studied_definitions = link.entries.pluck(:definition)
  	
  	current_word = find("#japanese-word").text
  	current_definition = find("#english-def").text

  	expect(studied_words).to include(current_word)
  	expect(studied_definitions).to include(current_definition)
  	
  	find("#next-card-button").click
  	
  	shown_words = []
  	shown_words << current_word
  	old_word = current_word
  	current_word = find("#japanese-word").text
  	shown_words << current_word
  	expect(current_word).not_to eq(old_word)
  	
  	find("#next-card-button").click
   	prompted = find("#prompt").text
   	expect(shown_words).to include(prompted)
 	
 	  click_answer(link.entries)
  	find("#next-card-button").click
  	find("#next-card-button").click  

  	click_answer(link.entries)
  	click_answer(link.entries)
  	click_answer(link.entries, false)
  	click_answer(link.entries)

  	expect(page).to have_content("3/4")
  	expect(page).to have_selector(:css, "a[href='#{link.url}']") 	
  end
  scenario "Editor edits an entry" do
    sign_in editor
    visit root_path
    click_on "Learn"

    # Get the id of the first entry under common words
    word_id = page.first(:xpath, "//*[text()='#{link.entries[0].base_word}']/ancestor::*[self::tr][1]")[:id]

    # Click the edit button for the first entry
    page.first(:xpath, "//*[text()='#{link.entries[0].base_word}']/ancestor::*[self::tr]/td[4]/a").click

    find('#entry_priority').check
    click_on "Update Entry"

    # Make sure the entry has been moved under the priority words tab
    expect(page).to have_selector(:css, "table.priority-words tr##{word_id}")

  end
end
  	
def click_answer(entries, correct = true)
	prompted = find("#prompt").text
   	correct_answer = entries.find { |answer| answer["base_word"] == prompted }.definition

   	# Button is not an html button but a div, so need to use different way to click
   	page.find_all(:xpath, "//div[contains(concat(' ',normalize-space(@class), ' '), ' answer ')]
   		[normalize-space()#{correct ? '=' : '!=' }'#{correct_answer}']").first.click

   	find("#next-question").click 
end

