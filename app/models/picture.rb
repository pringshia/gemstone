class Picture < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  set_primary_key :id
  attr_accessible :id, :user_id, :link, :num_comments
end
