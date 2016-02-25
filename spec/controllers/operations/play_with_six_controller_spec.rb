require 'rails_helper'

describe Operations::PlayWithSixController do
  before(:each) do
    author = create(:user, :operation_maker)
    allow(subject).to receive(:current_user).and_return(author)

    @operation = create(:operation, author_id: author.id)
    @pws = create(:play_with_six, operation_id: @operation.id)
  end

  describe "GET index" do
    it "returns PWS items" do
      get :index, params: { operation_id: @operation.id }
      expect(response.body).to eq(ActiveModel::SerializableResource.new([@pws]).to_json)
    end
  end

  describe "GET show" do
    it "returns PWS item" do
      get :show, params: { operation_id: @operation.id, id: @pws.id }
      expect(response.body).to eq(ActiveModel::SerializableResource.new(@pws).to_json)
    end
  end

  describe "POST create" do
    it "creates PWS item" do
      new_pws = attributes_for(:play_with_six)
      post :create, params: { operation_id: @operation.id, play_with_six: new_pws }
      expect(response.status).to eq(201)

      created_pws = JSON.parse(response.body)
      expect(created_pws["operation_id"]).to eq(@operation.id)
      expect(created_pws["name"]).to eq(new_pws[:name])
      expect(created_pws["url"]).to eq(new_pws[:url])
    end
  end

  describe "PATCH update" do
    it "updates PWS item with new name" do
      @pws.name = "New Name"
      patch :update, params: { operation_id: @operation.id, id: @pws.id, play_with_six: { name: @pws.name } }
      expect(response.status).to eq(200)
      expect(response.body).to eq(ActiveModel::SerializableResource.new(@pws).to_json)
    end
  end

  describe "DELETE destroy" do
    it "deletes PWS item" do
      delete :destroy, params: { operation_id: @operation.id, id: @pws.id }
      expect(response.status).to eq(204)
      expect(Operations::PlayWithSix.all).to eq([])
    end
  end
end
