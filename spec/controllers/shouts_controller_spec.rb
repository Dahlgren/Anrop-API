require 'rails_helper'

describe ShoutsController do
  before(:each) do
    @user = create(:user)
    set_current_user(@user)

    @shout = create(:shout, user_id: @user.id)
  end

  describe "GET index" do
    it "returns shouts" do
      get :index
      compare_response_body_with_model response, [@shout]
    end
  end

  describe "GET show" do
    it "returns shout" do
      get :show, params: { id: @shout.id }
      compare_response_body_with_model response, @shout
    end
  end

  describe "POST create" do
    it "creates shout" do
      new_shout = attributes_for(:shout)
      post :create, params: { shout: new_shout }
      expect(response.status).to eq(201)

      created_shout = JSON.parse(response.body)
      expect(created_shout["user"]["id"]).to eq(@user.id)
      expect(created_shout["message"]).to eq(new_shout[:message])
      expect(Time.at(created_shout["created_at"])).to be_within(1.second).of(Time.now)
    end

    it "sets remote ip for created shout" do
      mock_ip = '1.2.3.4'
      new_shout = attributes_for(:shout)

      @request.env['REMOTE_ADDR'] = mock_ip
      post :create, params: { shout: new_shout }

      expect(response.status).to eq(201)
      expect(Shout.last.ip).to eq(mock_ip)
    end
  end

  describe "PATCH update" do
    it "updates shout with new message" do
      @shout.message = "New Message"
      patch :update, params: { id: @shout.id, shout: { message: @shout.message } }
      expect(response.status).to eq(200)
      compare_response_body_with_model response, @shout
    end
  end

  describe "DELETE destroy" do
    it "deletes shout" do
      delete :destroy, params: { id: @shout.id }
      expect(response.status).to eq(204)
      expect(Shout.all).to eq([])
    end
  end
end
