# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
      category_id 1
      user_id 1
      title "MyText"
      body "MyText"
    end
end