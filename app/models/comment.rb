class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :picture, :counter_cache => true
	has_many :ratings
	set_primary_key :id
    attr_accessible :id, :user_id, :picture_id, :comment_text
    attr_readonly :ratings_count

    def self.find_best_for(user)
    user = (user.class == User)? user.id : user
    find(:all, 
         :joins => ["LEFT OUTER JOIN ratings ON ratings.comment_id = comments.id"], 
         :select => "COUNT(1) ratings_count, comments.picture_id, comments.comment_text, comments.id"
         :group => "comments.id",
         :conditions => ["(comments.id NOT IN (SELECT comment_id FROM ratings WHERE ratings.user_id = ? )) AND comments.user_id <> ?", user, user], 
         :order => "ratings_count ASC", 
         :limit => 1)

  end
end
