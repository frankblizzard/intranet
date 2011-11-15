# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
      first_name "MyString"
      last_name "MyString"
      street "MyString"
      zip "MyString"
      city "MyString"
      bio "MyText"
      avatar "MyString"
      phone "MyString"
      user_id 1
    end
end