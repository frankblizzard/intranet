# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
      name "MyString"
      date_opened "2012-07-02 11:53:27"
      date_closed "2012-07-02 11:53:27"
      project_id 1
      closed false
      project_leader_id 1
      email_when_changed "MyString"
      client_emails "MyString"
    end
end