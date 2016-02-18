require "rails_helper"

RSpec.describe TraditionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/traditions").to route_to("traditions#index")
    end

    it "routes to #new" do
      expect(:get => "/traditions/new").to route_to("traditions#new")
    end

    it "routes to #show" do
      expect(:get => "/traditions/1").to route_to("traditions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/traditions/1/edit").to route_to("traditions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/traditions").to route_to("traditions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/traditions/1").to route_to("traditions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/traditions/1").to route_to("traditions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/traditions/1").to route_to("traditions#destroy", :id => "1")
    end

  end
end
