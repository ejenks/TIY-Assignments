class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
    end

    user.name = auth["info"]["nickname"]
    user.token = auth["credentials"]["token"]
    user.secret = auth["credentials"]["secret"]
    user.expires = auth["credentials"]["expires"]
    user.expires_at = auth["credentials"]["expires_at"]

    p "updating token to #{auth["credentials"]["token"]}"

    user.save
    user
  end

end
