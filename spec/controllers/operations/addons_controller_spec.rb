require 'rails_helper'

describe Operations::AddonsController do
  before(:each) do
    author = create(:user, :operation_maker)
    set_current_user(author)

    @operation = create(:operation, author_id: author.id)
    @addon = create(:addon, operation_id: @operation.id)
  end

  describe "GET index" do
    it "returns addons" do
      get :index, params: { operation_id: @operation.id }
      compare_response_body_with_model response, [@addon]
    end
  end

  describe "GET show" do
    it "returns addon" do
      get :show, params: { operation_id: @operation.id, id: @addon.id }
      compare_response_body_with_model response, @addon
    end
  end

  describe "POST create" do
    it "creates addon" do
      new_addon = attributes_for(:addon)
      post :create, params: { operation_id: @operation.id, addon: new_addon }
      expect(response.status).to eq(201)

      created_addon = JSON.parse(response.body)
      expect(created_addon["operation_id"]).to eq(@operation.id)
      expect(created_addon["name"]).to eq(new_addon[:name])
      expect(created_addon["url"]).to eq(new_addon[:url])
    end
  end

  describe "PATCH update" do
    it "updates addon with new name" do
      @addon.name = "New Name"
      patch :update, params: { operation_id: @operation.id, id: @addon.id, addon: { name: @addon.name } }
      expect(response.status).to eq(200)
      compare_response_body_with_model response, @addon
    end

    it "updates addon with new url" do
      @addon.url = "New Addon Url"
      patch :update, params: { operation_id: @operation.id, id: @addon.id, addon: { url: @addon.url } }
      expect(response.status).to eq(200)
      compare_response_body_with_model response, @addon
    end
  end

  describe "DELETE destroy" do
    it "deletes addon" do
      delete :destroy, params: { operation_id: @operation.id, id: @addon.id }
      expect(response.status).to eq(204)
      expect(Operations::Addon.all).to eq([])
    end
  end
end
