class Picture < ActiveRecord::Base
  belongs_to :user
  attr_accessible :id, :user_id, :link
end
