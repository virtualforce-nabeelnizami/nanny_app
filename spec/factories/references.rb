# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reference do
    name "MyString"
    phone_number 1
    email "MyString"
    relationship "MyString"
    privacy "MyString"
  end
end
