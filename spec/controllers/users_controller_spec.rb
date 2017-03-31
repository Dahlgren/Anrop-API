require 'rails_helper'

describe UsersController do
  before(:each) do
    @user = create(:user)
  end

  describe "GET index" do
    it "returns users" do
      get :index
      compare_response_body_with_model response, [@user]
    end
  end

  describe "GET show" do
    it "returns user" do
      get :show, params: { id: @user.id }
      compare_response_body_with_model response, @user
    end
  end
end
