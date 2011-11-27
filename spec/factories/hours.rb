# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hour do
      date "2011-11-25"
      amount 1.5
      extra false
      holiday false
      ill false
      project_id 1
      user_id 1
      task_id ""
    end
end