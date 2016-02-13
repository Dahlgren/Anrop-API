class User < ApplicationRecord
  alias_attribute :id, :user_id
  alias_attribute :name, :user_name
  alias_attribute :email, :user_email
  alias_attribute :algorithm, :user_algo
  alias_attribute :salt, :user_salt

  def authenticate_hash(expiration)
    digest = OpenSSL::Digest.new(self.algorithm)
    data = "#{self.user_id}#{expiration.to_s}"
    key = OpenSSL::HMAC.hexdigest(digest, self.salt, data)
    OpenSSL::HMAC.hexdigest(digest, key, data)
  end
end
