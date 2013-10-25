FactoryGirl.define do
  factory :member do
    first_name  { generate :string }
    middle_name { generate :string }
    last_name   { generate :string }
    number
    email
    password
    motto       { generate :string }
    photo
    post        { generate :string }
    parent_id      1
  end
end
