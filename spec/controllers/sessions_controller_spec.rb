require 'rails_helper'

describe SessionsController do
  before(:each) do
    @user = create(:user)
    @password = "password"
    @user.salt = "salt"
    @user.password = @user.hash_password(@password)
    @user.save
  end

  describe "GET index" do
    it "returns current user if logged in" do
      token = "token"
      session = Session.new
      session.token = token
      session.user = @user

      set_current_token(token)
      set_current_user(@user)

      get :index
      compare_response_body_with_model response, session
    end

    it "returns failure when not logged in" do
      get :index
      expect(response.status).to eq(403)
    end
  end

  describe "POST create" do
    it "creates session with valid username and password" do
      post :create, params: { session: { username: @user.name, password: @password } }
      expect(response.status).to eq(200)

      created_session = JSON.parse(response.body)
      expect(created_session["user"].to_json).to eq(ActiveModelSerializers::SerializableResource.new(@user).to_json)
      expect(created_session["token"]).to be
    end

    it "returns failure with invalid password" do
      post :create, params: { session: { username: @user.name, password: "wrong" } }
      expect(response.status).to eq(403)
    end

    it "returns failure with invalid user" do
      post :create, params: { session: { username: "wrong", password: @password } }
      expect(response.status).to eq(403)
    end
  end
end
