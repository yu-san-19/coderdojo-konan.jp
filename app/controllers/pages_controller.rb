class PagesController < ApplicationController

  def index
    @title = 'ページ一覧'
    @docs  = Document.all
    @url   = request.url
  end

  def show
    @doc = Document.new(params[:id])
    redirect_to root_url unless @doc.exists?
    @content = Kramdown::Document.new(@doc.content).to_html
    @url     = request.url
  end
end