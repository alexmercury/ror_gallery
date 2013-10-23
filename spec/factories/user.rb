FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@email.com"
    end
    password '12345678'
  end
end