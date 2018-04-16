class StaticpagesController < ApplicationController
  def index
    latest_event = get_latest_event
    @next_event_url = if Date.parse(latest_event['started_at']) > Date.today
                        latest_event['event_url']
                      else
                        nil
                      end
  end
  def next_event_is_still_planned
  end
  def ninjas_works
  end

  private
  def get_latest_event
    response = rest_client.get(params: {:series_id => 3786, :order => 2})
    json = JSON.parse(response.body)
    json['events'].first
  end
  def rest_client
    RestClient::Resource.new 'https://connpass.com/api/v1/event/'
  end
end
