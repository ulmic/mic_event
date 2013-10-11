FactoryGirl.define do
  factory :place do
    title
    description { generate :string }
  end
end
