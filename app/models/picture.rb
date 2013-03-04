class Picture < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  set_primary_key :id
  attr_accessible :id, :user_id, :link, :num_comments, :needs_comments

  def self.find_best_for(user)
    user = (user.class == User)? user.id : user
    find(:all, :conditions => ['user_id <> ?', user], :order => "num_comments ASC", :limit =>1)
  end
end
