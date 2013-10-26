FactoryGirl.define do
  factory :event do
    title
    description { generate :string }
    member
    place
    begin_datetime  { generate :datetime }
    end_datetime    { generate :datetime }
  end
end
