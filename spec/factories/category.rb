FactoryGirl.define do
  factory :category do
    sequence :title do |n|
      "Category_#{n}"
    end
  end
end