# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    description "MyString"
    place_id 1
    datetime "2013-10-11 16:36:42"
    member_id 1
  end
end
