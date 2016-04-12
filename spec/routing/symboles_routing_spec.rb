require "rails_helper"

RSpec.describe SymbolesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/symboles").to route_to("symboles#index")
    end

    it "routes to #new" do
      expect(:get => "/symboles/new").to route_to("symboles#new")
    end

    it "routes to #show" do
      expect(:get => "/symboles/1").to route_to("symboles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/symboles/1/edit").to route_to("symboles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/symboles").to route_to("symboles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/symboles/1").to route_to("symboles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/symboles/1").to route_to("symboles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/symboles/1").to route_to("symboles#destroy", :id => "1")
    end

  end
end
