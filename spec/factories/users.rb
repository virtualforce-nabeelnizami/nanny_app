require 'faker'

FactoryGirl.define  do
	factory :user do
		first_name  { Faker::Name.first_name }
		last_name { Faker::Name.last_name }
		email { Faker::Internet.email }
		password "password"
		password_confirmation "password"
		street_address { Faker::Address.street_address }
		city { Faker::Address.city }
		state { Faker::Address.us_state }
		zip_code { Faker::Address.zip_code }
		phone_number { Faker::PhoneNumber.phone_number }
		date_of_birth { rand(10.years).ago }
		religion { Faker::Lorem.words }
	end
end