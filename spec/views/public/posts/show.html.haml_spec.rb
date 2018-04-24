require 'rails_helper'

RSpec.describe "public/posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :body => "MyText",
      :title => "Title",
      :author_id => 2,
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    @body = Kramdown::Document.new(@post.body).to_html
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Title/)
  end
end
