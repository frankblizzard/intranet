# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :jc_comment do
      user_id 1
      commentable_id 1
      commentable_type "MyString"
      content "MyText"
      x1 1
      y1 1
      x2 1
      y2 1
      w 1
      h 1
    end
end