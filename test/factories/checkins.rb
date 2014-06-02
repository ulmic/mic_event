FactoryGirl.define do
  factory :checkin do
    member
    event
    member_id { Member.last.id }
    event_id { Event.last.id }
    description { generate :string }
    status :organizer
  end
end
