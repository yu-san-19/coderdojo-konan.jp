require 'rails_helper'

RSpec.describe "admin/posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :body => "MyText",
      :title => "MyString",
      :author_id => 1,
      :slug => "MyString"
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", admin_post_path(@post), "post" do

      assert_select "textarea[name=?]", "post[body]"

      assert_select "input[name=?]", "post[title]"

      assert_select "input[name=?]", "post[author_id]"

      assert_select "input[name=?]", "post[slug]"
    end
  end
end
