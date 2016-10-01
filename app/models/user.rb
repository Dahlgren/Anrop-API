class User < ApplicationRecord
  alias_attribute :id, :user_id
  alias_attribute :name, :user_name
  alias_attribute :email, :user_email
  alias_attribute :algorithm, :user_algo
  alias_attribute :password, :user_password
  alias_attribute :salt, :user_salt
  alias_attribute :avatar, :user_avatar

  scope :search, -> (name) { where("lower(user_name) like ?", "%#{name.downcase}%")}

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

  def hash_password(password)
    if self.algorithm == 'md5'
      Digest::MD5.hexdigest(Digest::MD5.hexdigest(password))
    else
      digest = OpenSSL::Digest.new(self.algorithm)
      OpenSSL::HMAC.hexdigest(digest, self.salt, password)
    end
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
