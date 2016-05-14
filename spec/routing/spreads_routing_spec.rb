require "rails_helper"

RSpec.describe SpreadsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/spreads").to route_to("spreads#index")
    end

    it "routes to #new" do
      expect(:get => "/spreads/new").to route_to("spreads#new")
    end

    it "routes to #show" do
      expect(:get => "/spreads/1").to route_to("spreads#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/spreads/1/edit").to route_to("spreads#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/spreads").to route_to("spreads#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/spreads/1").to route_to("spreads#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/spreads/1").to route_to("spreads#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/spreads/1").to route_to("spreads#destroy", :id => "1")
    end

  end
end
