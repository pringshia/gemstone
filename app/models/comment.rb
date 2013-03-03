class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :picture
	set_primary_key :id
    attr_accessible :id, :user_id, :picture_id, :commenttext, :num_ratings
end
