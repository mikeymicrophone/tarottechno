require "rails_helper"

RSpec.describe SuitsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/suits").to route_to("suits#index")
    end

    it "routes to #new" do
      expect(:get => "/suits/new").to route_to("suits#new")
    end

    it "routes to #show" do
      expect(:get => "/suits/1").to route_to("suits#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/suits/1/edit").to route_to("suits#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/suits").to route_to("suits#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/suits/1").to route_to("suits#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/suits/1").to route_to("suits#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/suits/1").to route_to("suits#destroy", :id => "1")
    end

  end
end
