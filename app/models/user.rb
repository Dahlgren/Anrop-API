class User < ApplicationRecord

  def authenticate_hash(expiration)
    digest = OpenSSL::Digest.new(self.user_algo)
    data = "#{self.user_id}#{expiration.to_s}"
    key = OpenSSL::HMAC.hexdigest(digest, self.user_salt, data)
    OpenSSL::HMAC.hexdigest(digest, key, data)
  end
end
