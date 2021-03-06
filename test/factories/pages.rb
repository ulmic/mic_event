FactoryGirl.define do
  factory :page do
    title "MyText"
    slug { generate :string }
    body "MyText"
    publish { DateTime.now }
    author_id { Member.last ? Member.last.id : 1 }
  end
end
