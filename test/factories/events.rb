FactoryGirl.define do
  factory :event do
    title
    description { generate :string }
    member
    place
    begin_datetime  { generate :datetime }
    end_datetime    { generate :datetime }
    program_id 1
  end
end
