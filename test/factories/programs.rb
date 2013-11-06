FactoryGirl.define do
  factory :program do
    name        { generate :string }
    lider_id    1
    description { generate :string }
    logo        { generate :file }
  end
end
