class User < ActiveRecord::Base
  has_many :pictures
  has_many :comments
  has_many :ratings
  attr_accessible :id, :tokens
  self.primary_key = :id

  def to_param
    id
  end

  def self.from_omniauth(auth)
        where(:id => auth.uid).first_or_initialize.tap do |user|
        user.oauth_token = auth.credentials.token
        user.name = auth.info.name
        user.id = auth.uid
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
    end
  end

  def self.update_tokens(rating)
    if rating.is_positive
      comment = Comment.find(rating.comment_id)
      tokenupdate = User.find(comment.user_id)
      tokenupdate.increment!(:tokens)
    end
  end
end
