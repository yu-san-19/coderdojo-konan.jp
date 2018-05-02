class Admin::SessionsController < Admin::Base

  def index
  end 

  def new 
    client = SlackConnector.new
    redirect_to client.auth_path
  end 

  def login
    state = params[:state]
    raise "invalid" if state != EasySettings.slack.state || params[:error].present?

    client = SlackConnector.new
    code   = params[:code]

    # ユーザの情報を取得
    res = client.get_info(code)

    if res[:ok]                                                                                                                                                                                                    
      raise "invalid team" if res[:team_name] != EasySettings.slack.team_name

      session[:user] = {}.tap do |u| 
        u[:id]            = res[:user_id]
        u[:access_token]  = res[:access_token]
        u[:time]          = Time.zone.now
      end 

      # ログイン成功後のリダイレクト先。今回はrootへ戻します。
      redirect_to admin_posts_url, notice: "ログイン成功"
    else
      redirect_to admin_posts_url, notice: "ログイン失敗"
    end 
  rescue
    redirect_to admin_posts_url, notice: "ログイン失敗"
  end 
end