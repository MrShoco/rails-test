class UserOauthService
  def self.find_or_create(auth_hash)
    return nil if auth_hash.blank?

    social_profile = SocialProfile.where(provider: auth_hash['provider'], uid: auth_hash['uid']).first

    social_profile ||= SocialProfile.create(auth_params(auth_hash))

    social_profile.user
  end

  def self.auth_params(auth_hash)
    hash = auth_hash.select { |k, _| ['uid', 'provider'].include?(k) }
    ['email', 'name', 'image'].each { |k| hash[k] = auth_hash['info'][k] }

    hash
  end
end