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
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Slug/)
  end
end
