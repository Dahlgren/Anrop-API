class User < ApplicationRecord
  alias_attribute :id, :user_id
  alias_attribute :name, :user_name
  alias_attribute :email, :user_email
  alias_attribute :algorithm, :user_algo
  alias_attribute :salt, :user_salt
  alias_attribute :avatar, :user_avatar

  has_many :shouts, foreign_key: "shout_name"

  AVATAR_BASE_URL = "https://www.anrop.se/images/avatars/"

  ROLES = {
    operations: '7',
  }

  def avatar_url
    if avatar and avatar.length > 0
      "#{AVATAR_BASE_URL}#{avatar}"
    else
      "#{AVATAR_BASE_URL}noavatar100.png"
    end
  end

  def authenticate_hash(expiration)
    digest = OpenSSL::Digest.new(self.algorithm)
    data = "#{self.user_id}#{expiration.to_s}"
    key = OpenSSL::HMAC.hexdigest(digest, self.salt, data)
    OpenSSL::HMAC.hexdigest(digest, key, data)
  end

  def has_role?(role)
    self.user_groups && self.user_groups.include?(ROLES[role])
  end

  def admin?
    self.user_level >= 102
  end

  def superadmin?
    self.user_level >= 103
  end
end
