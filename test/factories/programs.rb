FactoryGirl.define do
  factory :program do
    name        { generate :string }
    lider_id    1
    description { generate :string }
  end
end
