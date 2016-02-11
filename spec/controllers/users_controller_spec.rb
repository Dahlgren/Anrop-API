require 'rails_helper'

describe UsersController do
  describe "GET index" do
    it "returns users" do
      user = create(:user)
      get :index
      expect(response.body).to eq([user].to_json)
    end
  end

  describe "GET show" do
    it "returns user" do
      user = create(:user)
      get :show, params: { id: user.id }
      expect(response.body).to eq(user.to_json)
    end
  end
end
