class Picture < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  self.primary_key = :id
  attr_accessible :id, :user_id, :link, :comments_count

  def self.find_best_for(user)
    user = (user.class == User)? user.id : user
    find(:all, 
         :conditions => ['user_id <> ?', user], 
         :order => "comments_count ASC", 
         :limit => 1)
  end
end
