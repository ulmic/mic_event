FactoryGirl.define do
  factory :event do
    title
    description { generate :string }
    member
    photo
    place
    begin_datetime  "2010-10-10 16:19:00 UTC"
    end_datetime    "2010-10-11 16:19:00 UTC"
    program_id 1
  end
end
