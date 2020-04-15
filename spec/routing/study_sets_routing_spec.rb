require "rails_helper"

RSpec.describe StudySetsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/study_sets").to route_to("study_sets#index")
    end

    it "routes to #new" do
      expect(:get => "/study_sets/new").to route_to("study_sets#new")
    end

    it "routes to #show" do
      expect(:get => "/study_sets/1").to route_to("study_sets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/study_sets/1/edit").to route_to("study_sets#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/study_sets").to route_to("study_sets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/study_sets/1").to route_to("study_sets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/study_sets/1").to route_to("study_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/study_sets/1").to route_to("study_sets#destroy", :id => "1")
    end
  end
end
