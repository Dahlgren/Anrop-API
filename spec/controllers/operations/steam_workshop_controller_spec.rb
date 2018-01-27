require 'rails_helper'

describe Operations::SteamWorkshopController do
  before(:each) do
    author = create(:user, :operation_maker)
    set_current_user(author)

    @operation = create(:operation, author_id: author.id)
    @steam_workshop = create(:steam_workshop, operation_id: @operation.id)
  end

  describe "GET index" do
    it "returns Steam Workshop items" do
      get :index, params: { operation_id: @operation.id }
      compare_response_body_with_model response, [@steam_workshop]
    end
  end

  describe "GET show" do
    it "returns Steam Workshop item" do
      get :show, params: { operation_id: @operation.id, id: @steam_workshop.id }
      compare_response_body_with_model response, @steam_workshop
    end
  end

  describe "POST create" do
    it "creates Steam Workshop item" do
      new_steam_workshop = attributes_for(:steam_workshop)
      post :create, params: { operation_id: @operation.id, steam_workshop: new_steam_workshop }
      expect(response.status).to eq(201)

      created_steam_workshop = JSON.parse(response.body)
      expect(created_steam_workshop["operation_id"]).to eq(@operation.id)
      expect(created_steam_workshop["steam_workshop_id"]).to eq(new_steam_workshop[:steam_workshop_id])
    end
  end

  describe "PATCH update" do
    it "updates Steam Workshop item with new name" do
      @steam_workshop.steam_workshop_id += 1
      patch :update, params: { operation_id: @operation.id, id: @steam_workshop.id, steam_workshop: { steam_workshop_id: @steam_workshop.steam_workshop_id } }
      expect(response.status).to eq(200)
      compare_response_body_with_model response, @steam_workshop
    end
  end

  describe "DELETE destroy" do
    it "deletes Steam Workshop item" do
      delete :destroy, params: { operation_id: @operation.id, id: @steam_workshop.id }
      expect(response.status).to eq(204)
      expect(Operations::SteamWorkshop.all).to eq([])
    end
  end
end
