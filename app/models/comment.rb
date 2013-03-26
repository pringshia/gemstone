class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :picture, :counter_cache => true
	has_many :ratings
	self.primary_key = :id
    attr_accessible :id, :user_id, :picture_id, :comment_text, :ratings_count

    def self.find_best_for(user)
    user = (user.class == User)? user.id : user
    find(:all, 
         :joins => ["LEFT OUTER JOIN ratings ON ratings.comment_id = comments.id"], 
         :conditions => ["(comments.id NOT IN (SELECT ratings.comment_id FROM ratings WHERE ratings.user_id = ? )) AND comments.user_id <> ?", user, user], 
         :order => "comments.ratings_count ASC", 
         :limit => 1)

  end
end
