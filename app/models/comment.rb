class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :picture, :counter_cache => true
	has_many :ratings
	self.primary_key = :id
  attr_accessible :id, :user_id, :picture_id, :comment_text, :ratings_count, :redeemed
  validates_presence_of :comment_text

    def self.find_best_for(user)
    user = (user.class == User)? user.id : user
    find(:all, 
         :joins => ["LEFT OUTER JOIN ratings ON ratings.comment_id = comments.id LEFT OUTER JOIN pictures ON pictures.id = comments.picture_id"], 
         :conditions => ["(comments.id NOT IN (SELECT ratings.comment_id FROM ratings WHERE ratings.user_id = ? )) AND comments.user_id <> ? AND pictures.user_id <> ?", user, user, user], 
         :order => "comments.ratings_count ASC", 
         :limit => 1)

    end

    def self.redeem_comment (picture)
    picture = (picture.class == Picture)? picture.id : picture
    com = find(:all,
         :conditions => ["comments.picture_id = ? AND comments.redeemed = ? AND comments.net_ratings > -1", picture, false],
         :order => "comments.net_ratings DESC",
         :limit => 1)
      
    com[0].update_attributes(:redeemed => true)
    end

end
