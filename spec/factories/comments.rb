# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
      content "MyText"
      commentable_id 1
      commentable_type "MyString"
    end
end