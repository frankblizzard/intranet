# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
      nr "MyString"
      name "MyString"
      client_id 1
      description "MyText"
      active false
      hidden false
    end
end