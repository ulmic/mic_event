FactoryGirl.define do
  factory :member do
    first_name  { generate :string }
    middle_name { generate :string }
    last_name   { generate :string }
    motto       { generate :string }
    photo
    post        { generate :string }
    parent_id      1
    user
    user_id { User.last.id }
    association :departament
    departament_id { Departament.last.id }
    birthdate { generate :date }
    phone
    mail_index "000000"
    home_adress { generate :string }
  end
end
