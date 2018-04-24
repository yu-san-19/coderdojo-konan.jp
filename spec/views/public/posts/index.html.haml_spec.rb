require 'rails_helper'

RSpec.describe "public/posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :body => "MyText",
        :title => "Title",
        :author_id => 2,
        :slug => "Slug"
      ),
      Post.create!(
        :body => "MyText",
        :title => "Title",
        :author_id => 2,
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
