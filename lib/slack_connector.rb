class SlackConnector

  def initialize
    @client_id     = EasySettings.slack.client_id.to_s
    @client_secret = EasySettings.slack.secret_key
    @scope         = EasySettings.slack.scope
    @team_name     = EasySettings.slack.team_name
    @redirect_uri  = EasySettings.slack.redirect_url
    @state         = EasySettings.slack.state
  end 

  def auth_path
    "#{auth_host}client_id=#{@client_id}&state=#{@state}&scope=#{@scope}&team=#{@team_name}&redirect_uri=#{@redirect_uri}"
  end 

  def get_info(code)
    path = "#{acs_host}client_id=#{@client_id}&client_secret=#{@client_secret}&code=#{code}&redirect_uri=#{@redirect_uri}"

    rest_client = RestClient::Resource.new path
    response = rest_client.get(path)
    res_json = JSON.parse(response.body)

    HashWithIndifferentAccess.new(res_json)                                                                                                                                               
  end

  private
  def auth_host
    EasySettings.slack.url.auth
  end

  def acs_host
    EasySettings.slack.url.info
  end
end