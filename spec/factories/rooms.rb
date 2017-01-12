FactoryGirl.define do
  factory :room do
    sequence(:name) { |n| "Room n°#{n}" }
  end
end
