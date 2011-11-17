FactoryGirl.define do
  
  factory :user do
    first_name 'John'
    last_name  'Doe'
    username   'johndoe'
    passwort   'secret'
    password_confirmation {|u| u.password}
    sequence(:email) {|n| "email#{n}@factory.com" }
    admin      false
  end

  factory :admin, :parent => :user do
    admin true
  end
  
  factory :post do
    title "Post title"
    body  "lorem ipsum"
    association :user
    association :post_category
  end
  
  factory :post_category do
     name "MyCategory"
  end
  
  factory :comment do
    content "ein kommentar"
    commentable_id 1
    commentable_type "Post"
  end
  
end