require 'spec_helper'

describe StaticpagesController, type: :controller do
  describe "Request GET #index" do
    before do
      get :index
    end
    it "set @next_event_url" do
      today = DateTime.now
      result = JSON.parse(RestClient.get('https://connpass.com/api/v1/event/?series_id=3786&order=1&keyword=CoderDojo+%E5%B2%A1%E5%B1%B1+%E5%B2%A1%E5%8D%97').body)
      next_event_url = result["events"][0]["event_url"]
      next_event_date = result["events"][0]["started_at"]
      if today < next_event_date then
        expect(assigns[:next_event_url]).to eq next_event_url
      else
        expect(assigns[:next_event_url]).to eq next_event_is_still_planned_url
      end
    end
  end
end