require 'spec_helper'

describe Comment do
	before do
		@picture = FactoryGirl.create(:picture)
		@first_comment = FactoryGirl.create(:comment,:picture_id => @picture.id)
		@second_comment = FactoryGirl.create(:comment,:picture_id => @picture.id, :created_at => Time.now + rand(100))
	end

	it "should return the first comment" do
		Comment.redeem_comment(@picture)
		@first_comment.reload
		@first_comment.redeemed.should equal(true)		
	end

	it "should not be redeemed" do
		Comment.redeem_comment(@picture)
		@second_comment.reload
		@second_comment.redeemed.should equal(false)
	end
end

