# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :availability do
    user_id 1
    start_hour 1
    end_hour 1
    day_of_week 1
  end
end
