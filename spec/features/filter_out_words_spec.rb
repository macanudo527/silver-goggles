require 'rails_helper'

RSpec.describe "entry selection before learning" do
  let(:user) { create(:user) }
  let!(:link) { create(:link_with_entries) }
  let!(:source) { create(:source) }
  let(:priority_entry) { create(:priority_entry) }
  let(:grammar_entry) { create(:grammar_entry) }

  let!(:click) { link.clicks.create(user: user) }
  let(:study_set) { StudySet.create(user: user, link: link) }

  scenario "with entries already attached to another article" do

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

  	learn_first_article

    # user shouldn't see the duplicate entries
    expect(page).not_to have_content(dupe_entry.base_word)
    expect(page).not_to have_content(priority_entry.base_word)
    expect(page).not_to have_content(grammar_entry.base_word)
  end

  scenario "when user deletes entry from link" do 
    # Stubbing Choosing words to study
    study_set.entries << link.entries << priority_entry  << grammar_entry

    learn_first_article

    accept_alert do
        find("tr#entry-#{link.entries.first.id} a.delete_entry_link").click
    end

    expect(page).not_to have_selector(:css, "tr#entry-#{link.entries.first.id}") 
  end

  scenario "when entries have secondary meanings" do 

    # Stubbing choosing words to study
    secondary_meaning_of_first = create(:entry)
    secondary_meaning_of_first.primary_id = link.entries.first.id

    link.entries << secondary_meaning_of_first

    learn_first_article

    # User shouldn't intially see the secondary meaning of the word
    expect(page).not_to have_content(secondary_meaning_of_first.base_word)

    find(".alt-tab").click
    expect(page).to have_content(secondary_meaning_of_first.base_word)
    expect(page).to have_unchecked_field("study_set_#{secondary_meaning_of_first.id}")
  end

  def learn_first_article
    sign_in user
    visit root_path
    click_on "Learn" 
  end



end