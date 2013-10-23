FactoryGirl.define do
  factory :category do
    sequence :slug do |n|
      "category_#{n}"
    end
  end
end