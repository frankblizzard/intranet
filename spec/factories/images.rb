# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image do
      name "MyString"
      user_id 1
      project_id 1
      rating 1.5
      source "MyString"
    end
end