FactoryGirl.define do
  
  factory :user do |u|
    u.sequence(:username) {|n| "johndoe#{n}" }
    u.password   'secret'
    u.password_confirmation {|u| u.password}
    u.sequence(:email) {|n| "email#{n}@factory.com" }
    u.after_build { |p| Factory(:profile, :user_id => u.id)} 
  end
  
  factory :profile do |p|
    p.full_name "Thomas Maximini"
    p.user  { |u| u.association(:user) }
    p.avatar "dummy.jpg"
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
  
  factory :client do
    name "MyString"
    full_name "MyString"
    client_nr "MyString"
    website "MyString"
  end
  
  factory :project_status do
    name "MyString"
  end
  
  factory :project do
    nr "MyString"
    name "MyString"
    client_id 1
    description "MyText"
    active false
    hidden false
  end
  
end