require 'rails_helper'

describe Operations::GroupsController do
  before(:each) do
    author = create(:user, :operation_maker)
    set_current_user(author)

    @operation = create(:operation, author_id: author.id)
    @group = create(:group, operation_id: @operation.id)
  end

  describe "GET index" do
    it "returns groups" do
      get :index, params: { operation_id: @operation.id }
      compare_response_body_with_model response, [@group]
    end
  end

  describe "GET show" do
    it "returns group" do
      get :show, params: { operation_id: @operation.id, id: @group.id }
      compare_response_body_with_model response, @group
    end
  end

  describe "POST create" do
    it "creates group" do
      new_group = attributes_for(:group)
      post :create, params: { operation_id: @operation.id, group: new_group }
      expect(response.status).to eq(201)

      created_group = JSON.parse(response.body)
      expect(created_group["operation_id"]).to eq(@operation.id)
      expect(created_group["name"]).to eq(new_group[:name])
      expect(created_group["url"]).to eq(new_group[:url])
    end
  end

  describe "PATCH update" do
    it "updates group with new name" do
      @group.name = "New Name"
      patch :update, params: { operation_id: @operation.id, id: @group.id, group: { name: @group.name } }
      expect(response.status).to eq(200)
      compare_response_body_with_model response, @group
    end

    it "updates group with new order" do
      @group.order = -1
      patch :update, params: { operation_id: @operation.id, id: @group.id, group: { order: -1 } }
      expect(response.status).to eq(200)
      compare_response_body_with_model response, @group
    end
  end

  describe "DELETE destroy" do
    it "deletes group" do
      delete :destroy, params: { operation_id: @operation.id, id: @group.id }
      expect(response.status).to eq(204)
      expect(Operations::Group.all).to eq([])
    end
  end
end
