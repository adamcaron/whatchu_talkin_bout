class User < ActiveRecord::Base
  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.uid)

    user.nickname    = data.info.nickname
    user.name        = data.info.name
    user.email       = data.info.email
    user.location    = data.info.location
    user.provider    = data.provider
    user.token       = data.credentials.token
    user.uid         = data.uid
    user.image       = data.info.image
    user.description = data.info.description
    user.urls        = data.info.urls

    user.save

    user
  end
end