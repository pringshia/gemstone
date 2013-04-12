require 'spec_helper'

describe Comment do
	before do
		@picture = FactoryGirl.create(:picture)
		@first_comment = FactoryGirl.create(:comment,:picture_id => @picture.id)
		@second_comment = FactoryGirl.create(:comment,:picture_id => @picture.id, :created_at => Time.now + rand(100))
	end

	it "should return the first comment" do
		redeemed_comment = Comment.find_redeem_comment(@picture).first
		redeemed_comment.id.should equal(@first_comment.id)		
	end

	it "should not be redeemed" do
		redeemed_comment = Comment.find_redeem_comment(@picture).first
		redeemed_comment.reload
		redeemed_comment.redeemed.should equal(false)
	end
end

