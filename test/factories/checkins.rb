FactoryGirl.define do
  factory :checkin do
    member_id { generate :integer }
    place_id  { generate :integer }
    description { generate :string }
    status :organizer
  end
end
