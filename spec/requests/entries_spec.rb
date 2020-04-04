require 'rails_helper'

RSpec.describe "Entries", type: :request do
  describe "entries" do
  	let(:link) {create(:link_with_entries)}

    it "displays all entries for link" do
      expect(link.entries.count).to eq(5)
      get "/links/" + link.id.to_s + "/entries"
      expect(response.body).to include(link.entries.first.base_word)
 #     expect(response).to have_http_status(200)
    end
  end
end
