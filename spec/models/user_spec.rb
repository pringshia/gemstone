require 'spec_helper'

describe User do
	before do
		@user_invalid_token = User.new.tap do |u|
			u.tokens = -1
		end
		@user_valid = User.new.tap do |u|
			u.name = "Will"
		end
		@user_no_name = User.new
	end

	it "is valid with proper values"
	it "is not valid without a name"
	it "is not valid with tokens less than zero"

	it "is valid with proper values" do
		@user_valid.should be_valid	
	end

	it "is not valid without a name" do
		@user_no_name.should_not be_valid
	end

	it "is not valid with tokens less than zero" do
		@user_invalid_token.should_not be_valid 
	end
end

