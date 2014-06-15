FactoryGirl.define do
  factory :author, class: "Member" do
    first_name  { generate :string }
    middle_name { generate :string }
    last_name   { generate :string }
    motto       { generate :string }
    photo
    post        { generate :string }
    parent_id      1
    user
    user_id { User.last.id }
  end
end
