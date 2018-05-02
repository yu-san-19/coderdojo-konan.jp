require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #acs" do
    it "returns http success" do
      get :acs
      expect(response).to have_http_status(:success)
    end
  end

end
