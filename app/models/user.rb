class User < ActiveRecord::Base
  has_many :fonts

  def self.from_omniauth(auth)
  	where(auth.slice("provider", "uid", "name", "location", "image")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
  	create! do |user|
  	  user.provider = auth["provider"]
  	  user.uid = auth["uid"]
  	  user.name = auth["info"]["nickname"]
  	  user.location = auth["info"]["location"]
  	  user.image = auth["info"]["image"]
  	end
  end

end