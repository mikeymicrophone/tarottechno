require "rails_helper"

RSpec.describe InterpretationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/interpretations").to route_to("interpretations#index")
    end

    it "routes to #new" do
      expect(:get => "/interpretations/new").to route_to("interpretations#new")
    end

    it "routes to #show" do
      expect(:get => "/interpretations/1").to route_to("interpretations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/interpretations/1/edit").to route_to("interpretations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/interpretations").to route_to("interpretations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/interpretations/1").to route_to("interpretations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/interpretations/1").to route_to("interpretations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/interpretations/1").to route_to("interpretations#destroy", :id => "1")
    end

  end
end
