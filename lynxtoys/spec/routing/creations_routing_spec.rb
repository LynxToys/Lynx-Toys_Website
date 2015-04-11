require "rails_helper"

RSpec.describe CreationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/creations").to route_to("creations#index")
    end

    it "routes to #new" do
      expect(:get => "/creations/new").to route_to("creations#new")
    end

    it "routes to #show" do
      expect(:get => "/creations/1").to route_to("creations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/creations/1/edit").to route_to("creations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/creations").to route_to("creations#create")
    end

    it "routes to #update" do
      expect(:put => "/creations/1").to route_to("creations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/creations/1").to route_to("creations#destroy", :id => "1")
    end

  end
end
