require 'rails_helper'

describe Operations::SlotsController do
  before(:each) do
    author = create(:user, :operation_maker)
    set_current_user(author)

    @operation = create(:operation, author_id: author.id)
    @group = create(:group, operation_id: @operation.id)
    @slot = create(:slot, group_id: @group.id)
  end

  describe "GET index" do
    it "returns slots" do
      get :index, params: { operation_id: @operation.id, group_id: @group.id }
      expect(response.body).to eq(ActiveModelSerializers::SerializableResource.new([@slot]).to_json)
    end
  end

  describe "GET show" do
    it "returns slot" do
      get :show, params: { operation_id: @operation.id, group_id: @group.id, id: @slot.id }
      expect(response.body).to eq(ActiveModelSerializers::SerializableResource.new(@slot).to_json)
    end
  end

  describe "POST create" do
    it "creates slot" do
      new_slot = attributes_for(:slot)
      post :create, params: { operation_id: @operation.id, group_id: @group.id, slot: new_slot }
      expect(response.status).to eq(201)

      created_slot = JSON.parse(response.body)
      expect(created_slot["operation_id"]).to eq(@operation.id)
      expect(created_slot["group_id"]).to eq(@group.id)
      expect(created_slot["name"]).to eq(new_slot[:name])
      expect(created_slot["url"]).to eq(new_slot[:url])
    end
  end

  describe "PATCH update" do
    it "updates slot with new name" do
      @slot.name = "New Name"
      patch :update, params: { operation_id: @operation.id, group_id: @group.id, id: @slot.id, slot: { name: @slot.name } }
      expect(response.status).to eq(200)
      expect(response.body).to eq(ActiveModelSerializers::SerializableResource.new(@slot).to_json)
    end

    it "updates slot with new order" do
      @slot.order = -1
      patch :update, params: { operation_id: @operation.id, group_id: @group.id, id: @slot.id, slot: { order: -1 } }
      expect(response.status).to eq(200)
      expect(response.body).to eq(ActiveModelSerializers::SerializableResource.new(@slot).to_json)
    end
  end

  describe "DELETE destroy" do
    it "deletes slot" do
      delete :destroy, params: { operation_id: @operation.id, group_id: @group.id, id: @slot.id }
      expect(response.status).to eq(204)
      expect(Operations::Slot.all).to eq([])
    end
  end
end
