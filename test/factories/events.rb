FactoryGirl.define do
  factory :event do
    title
    description { generate :string }
    member
    place
  end
end
