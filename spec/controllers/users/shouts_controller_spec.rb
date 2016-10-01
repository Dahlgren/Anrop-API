require 'rails_helper'

describe Users::ShoutsController do
  before(:each) do
    @user = create(:user)
    set_current_user(@user)

    @shout = create(:shout, user_id: @user.id)
  end

  describe "GET index" do
    it "returns shouts" do
      get :index, params: { user_id: @user.id }
      expect(response.body).to eq(ActiveModelSerializers::SerializableResource.new([@shout]).to_json)
    end
  end
end
