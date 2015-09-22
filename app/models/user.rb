class User < ActiveRecord::Base
  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.uid)

    user.nickname    = r.info.nickname
    user.name        = r.info.name
    user.email       = r.info.email
    user.location    = r.info.location
    user.provider    = r.provider
    user.token       = r.credentials.token
    user.uid         = r.uid
    user.image       = r.info.image
    user.description = r.info.description
    user.urls        = r.info.urls

    user.save

    user
  end
end