class User < ActiveRecord::Base
  def admin?
    return true if self.role == 'admin' 
  end

  def to_s
    username
  end

  def self.from_omniauth(omniauth_hash)
    User.where(provider: omniauth_hash['provider'], uid: omniauth_hash['uid']).first
  end
end
