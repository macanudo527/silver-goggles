require "rails_helper"

RSpec.describe StudyRecordsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/study_records").to route_to("study_records#index")
    end

    it "routes to #new" do
      expect(:get => "/study_records/new").to route_to("study_records#new")
    end

    it "routes to #show" do
      expect(:get => "/study_records/1").to route_to("study_records#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/study_records/1/edit").to route_to("study_records#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/study_records").to route_to("study_records#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/study_records/1").to route_to("study_records#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/study_records/1").to route_to("study_records#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/study_records/1").to route_to("study_records#destroy", :id => "1")
    end
  end
end
