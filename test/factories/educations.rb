# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :education do
    user_id 1
    level 1
    school_name "MyString"
    school_id 1
    major "MyString"
    graduation_year 1
  end
end
