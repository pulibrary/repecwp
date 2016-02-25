class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:cas]

  def admin?
    return true if self.role == 'admin' 
  end

  def to_s
    username
  end

  def self.from_omniauth(access_token)
    User.where(provider: access_token.provider, uid: access_token.uid).first
  end
end
