# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review_image do
      review_id 1
      name "MyString"
      project_id 1
    end
end