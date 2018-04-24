require 'rails_helper'

RSpec.describe "admin/posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      :body => "MyText",
      :title => "MyString",
      :author_id => 1,
      :slug => "MyString"
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", admin_posts_path, "post" do

      assert_select "textarea[name=?]", "post[body]"

      assert_select "input[name=?]", "post[title]"

      assert_select "input[name=?]", "post[author_id]"

      assert_select "input[name=?]", "post[slug]"
    end
  end
end
