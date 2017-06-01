FactoryGirl.define do
  factory :key do
    name FFaker::Lorem.word
    company
  end
end
