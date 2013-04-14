class Picture < ActiveRecord::Base
  has_many :comments
  belongs_to :user, :counter_cache => true
  self.primary_key = :id
  attr_accessible :id, :user_id, :link, :comments_count, :unredeemed_count, :caption
  validates_presence_of :link 
  validates_uniqueness_of :link

  def self.find_best_for(user)
    user = (user.class == User)? user.id : user
    find(:all, 
          :joins => "LEFT OUTER JOIN comments ON comments.picture_id = pictures.id",
         :conditions => ['(pictures.id NOT IN (SELECT comments.picture_id FROM comments WHERE comments.user_id = ?)) AND pictures.user_id <> ?', user, user], 
         :select => 'DISTINCT pictures.*',
         :order => "comments_count ASC", 
         :limit => 3)
  end
  
  def unredeemed_count
    Comment.count(conditions: ["picture_id = ? AND redeemed = ?", self.id, false])
  end
  
end
