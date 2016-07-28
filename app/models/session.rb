class Session
  include ActiveModel::Serialization

  attr_accessor :username
  attr_accessor :password

  attr_accessor :token
  attr_accessor :user

  def initialize(params = {})
    self.username = params[:username]
    self.password = params[:password]
  end

  def login
    return false if !self.username || !self.password

    user = User.where(name: self.username).first

    if user
      if user.password == user.hash_password(self.password)
        self.user = user
        generate_token
        return true
      end
    end

    return false
  end

  def generate_token
    expiration = 1.month.from_now.to_i
    authenticate_hash = self.user.authenticate_hash(expiration)
    self.token = "#{self.user.id}.#{expiration}.#{authenticate_hash}"
  end

end
