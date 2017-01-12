FactoryGirl.define do
  factory :message do
    sequence(:text) { |n| "Message #{n}" }
    room
  end
end
