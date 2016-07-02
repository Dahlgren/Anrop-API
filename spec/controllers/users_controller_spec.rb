require 'rails_helper'

describe UsersController do
  before(:each) do
    @user = create(:user)
  end

  describe "GET index" do
    it "returns users" do
      get :index
      expect(response.body).to eq(ActiveModelSerializers::SerializableResource.new([@user]).to_json)
    end
  end

  describe "GET show" do
    it "returns user" do
      get :show, params: { id: @user.id }
      expect(response.body).to eq(ActiveModelSerializers::SerializableResource.new(@user).to_json)
    end
  end
end
