require 'rails_helper'

RSpec.describe "User does not see entries already attached to another article" do
  let(:user) { create(:user) }
  let!(:link) { create(:link_with_entries) }
  let!(:source) { create(:source) }
  let(:priority_entry) { create(:priority_entry) }
  let(:grammar_entry) { create(:grammar_entry) }

  let!(:click) { link.clicks.create(user: user) }
  let(:study_set) { StudySet.create(user: user, link: link) }

  scenario "with 5 words due" do

  	# Stubbing Choosing words to study
  	study_set.entries << link.entries << priority_entry  << grammar_entry

    # create another link that contains one duplicate from the first link
    dupe_link = Link.new(title: "Article with dupes", url: "http://example.com", descrip: "descrip", image: "image.jpg", pubdate: Time.now, source: source)
    create_list(:entry, 4, links: [dupe_link])
    priority_entry.links << dupe_link
    grammar_entry.links << dupe_link
    dupe_entry = study_set.entries.first
    dupe_entry.links << dupe_link

    # remove original link from home page
    link.update(created_at: (Time.now - 8.days))

  	sign_in user
  	visit root_path
    click_on "Learn"

    expect(page).not_to have_content(dupe_entry.base_word)
    expect(page).not_to have_content(priority_entry.base_word)
    expect(page).not_to have_content(grammar_entry.base_word)


  end

end