FactoryBot.define do
  factory :post do
    body "MyText"
    title "MyString"
    published_at "2018-04-22 10:09:46"
    author_id 1
    slug "MyString"
  end
end