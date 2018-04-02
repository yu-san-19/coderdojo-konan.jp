class PagesController < ApplicationController

  def index
    @title = 'ページ一覧'
    @pages  = Page.all
    @url   = request.url
  end

  def show
    @page = Page.new(params[:id])
    @content = Kramdown::Document.new(@page.content).to_html
    @url     = request.url
  end
end