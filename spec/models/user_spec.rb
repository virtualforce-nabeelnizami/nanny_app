require 'spec_helper'

describe User do	
	it "has a valid factory" do
		create(:user).should be_valid
	end

	# it "is invalid without a first_name" do
	# 	build(:user, first_name: nil).should_not be_valid
	# end
	
	# it "is invalid without a last_name" do
	# 	build(:user, last_name: nil).should_not be_valid
	# end
	
	it "is invalid without a email_address" do
		build(:user, email: nil).should_not be_valid
	end

	it "is invalid with duplicate email_address" do
		create(:user, email: "test@example123.com")
		build(:user, email: "test@example123.com").should_not be_valid
	end

	it "is invalid without a street_address" do
		build(:user, street_address: nil).should_not be_valid
	end

	it "is invalid without a city" do
		build(:user, city: nil).should_not be_valid
	end
	
	it "is invalid without a state" do
		build(:user, state: nil).should_not be_valid
	end
	
	it "is invalid without a zip_code" do
		build(:user, zip_code: nil).should_not be_valid
	end
	
	it "is invalid without a phone_number" do
		build(:user, phone_number: nil).should_not be_valid
	end

	it "is invalid without a date_of_birth" do
		build(:user, date_of_birth: nil).should_not be_valid
	end

end

