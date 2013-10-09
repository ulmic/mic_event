FactoryGirl.define do
  factory :place do
    title       { generate :string }
    description { generate :string }
  end
end
