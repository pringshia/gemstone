class Picture < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  self.primary_key = :id
  attr_accessible :id, :user_id, :link, :comments_count, :unredeemed_count, :caption
  validates_presence_of :link 

  def self.find_best_for(user)
    user = (user.class == User)? user.id : user
    find(:all, 
         :conditions => ['user_id <> ?', user], 
         :order => "comments_count ASC", 
         :limit => 1)
  end
  
  def unredeemed_count
    Comment.count(conditions: ["picture_id = ? AND redeemed = ?", self.id, false])
  end
  
end
