module AuthorizationHelper
  def create_authorization_token(token)
    ActionController::HttpAuthentication::Token.encode_credentials(token)
  end
end


RSpec.configure do |c|
  c.include AuthorizationHelper
end
