require 'spec_helper'

describe StaticpagesController, type: :controller do
  describe "Request GET #index" do
    describe "Get latest event" do
      it "return correct date" do
      end
    end
    describe "@next_event_url" do
      context "when next event is not still planned" do
        it "return nil" do
        end
      end
      context "when next event is already planned" do
        it "return expected event url" do
        end
      end
    end
  end
end