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

	it "should not have any tokens" do
		user = FactoryGirl.build(:user)
		user.tokens.should equal(0)
	end

	it "should be the same as the id" do
		user = FactoryGirl.build(:user)
		user.to_param.should equal(user.id)
	end

	it "should have one token" do
		user = FactoryGirl.create(:user)
		comment = FactoryGirl.create(:comment, user_id: user.id)
		rating = FactoryGirl.create(:rating, comment_id: comment.id, is_positive: true)
		
		comment.user_id.should equal(user.id)
		rating.comment_id.should equal(comment.id)
		User.update_tokens(rating)
		user.reload
		user.tokens.should equal(1)
	end
end

