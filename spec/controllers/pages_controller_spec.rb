require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "Request GET #index" do
    it "@pages が表示されること" do
      get :index
      expect(assigns(:pages).first.title).to eq Page.all.first.title
    end
  end

  describe "Request GET #show" do
    it "@content が表示されること" do
      param    = 'visit-interview'
      get :show, params: {:id => param}
      page      = Page.new(param)
      expected = Kramdown::Document.new(page.content).to_html
      expect(assigns(:content)).to eq expected
    end
    
    context "ファイル名が存在する時" do
      before do
        get :show, params: {:id => 'not_found_hoge_hoge'}
      end
      it 'redirect status が 404 であること' do
        expect(response.status).to eq 404
      end
      it 'not_found_404.html.erb が表示されること' do
        expect(response).to render_template(:not_found_404)
      end
    end
  end
end