# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
      name "MyString"
      description "MyText"
      project_id 1
      deadline "2011-11-24"
    end
end