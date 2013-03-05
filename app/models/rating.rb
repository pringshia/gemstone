class Rating < ActiveRecord::Base
  belongs_to :picture
  belongs_to :user
  set_primary_key :id
  attr_accessible :id, :user_id, :comment_id, :positive
end
