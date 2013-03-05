class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :picture
	has_many :ratings
	set_primary_key :id
    attr_accessible :id, :user_id, :picture_id, :commenttext, :num_ratings

    def self.find_best_for(user)
    user = (user.class == User)? user.id : user
    find(:all, :joins => ["LEFT OUTER JOIN ratings ON ratings.comment_id = comments.id"], :conditions => ["(ratings.user_id <> ? OR ratings.user_id IS NULL) AND comments.user_id <> ?",user,user], :order => "num_ratings ASC", :limit => 1)

  end
end
