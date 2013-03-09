class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :comment, :counter_cache => true
	self.primary_key = :id
	attr_accessible :id, :user_id, :comment_id, :is_positive
end
