FactoryGirl.define do
  factory :member_without_photo, class: "Member" do
    first_name  { generate :string }
    middle_name { generate :string }
    last_name   { generate :string }
    motto       { generate :string }
    post        { generate :string }
    parent_id      1
    user
    user_id { User.last.id }
  end
end
