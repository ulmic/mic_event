FactoryGirl.define do
  factory :admin, class: "User" do
    email
    password
    role "admin"
  end
end
