module AuthorizationHelper
  def create_authorization_token(token)
    ActionController::HttpAuthentication::Token.encode_credentials(token)
  end

  def set_current_token(token)
    allow(subject).to receive(:current_token).and_return(token)
  end

  def set_current_user(user)
    allow(subject).to receive(:current_user).and_return(user)
  end
end


RSpec.configure do |c|
  c.include AuthorizationHelper
end
