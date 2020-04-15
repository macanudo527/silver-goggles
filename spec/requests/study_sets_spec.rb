require 'rails_helper'

RSpec.describe "StudySets", type: :request do
  describe "GET /study_sets" do
    it "works! (now write some real specs)" do
      get study_sets_path
      expect(response).to have_http_status(200)
    end
  end
end
