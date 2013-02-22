class User < ActiveRecord::Base
  attr_accessible :id
  set_primary_key :id

  def to_param
  	id
  end

end
