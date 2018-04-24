require "rails_helper"

RSpec.describe Public::PostsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/posts").to route_to("public/posts#index")
    end

    it "routes to #show" do
      expect(:get => "/posts/1").to route_to("public/posts#show", :id => "1")
    end
  end
end
