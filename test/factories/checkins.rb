FactoryGirl.define do
  factory :checkin do
    member
    event
    description { generate :string }
    status :organizer
  end
end
