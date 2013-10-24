FactoryGirl.define do
  factory :member do
    first_name  { generate :string }
    middle_name { generate :string }
    last_name   { generate :string }
    number      { generate :integer }
    email "nat.mu@mail.ru"
    password "123"
  end
end
