class Picture < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  set_primary_key :id
  attr_accessible :id, :user_id, :link
  attr_readonly :comments_count

  def self.find_best_for(user)
    user = (user.class == User)? user.id : user
    find(:all, 
	 :joins => "INNER JOIN comments ON comments.picture_id=pictures.id",
         :select => "COUNT(*) comments_count, pictures.id, pictures.link", 
         :conditions => ['user_id <> ?', user], 
         :group => "pictures.id",
         :order => "comments_count ASC", 
         :limit => 1)
  end
end
