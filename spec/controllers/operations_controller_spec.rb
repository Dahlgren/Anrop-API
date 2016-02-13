require 'rails_helper'

describe OperationsController do
  before(:each) do
    @operation = create(:operation)
  end

  describe "GET index" do
    it "returns operations" do
      get :index
      expect(response.body).to eq(ActiveModel::SerializableResource.new([@operation]).to_json)
    end
  end

  describe "GET show" do
    it "returns operation" do
      get :show, params: { id: @operation.id }
      expect(response.body).to eq(ActiveModel::SerializableResource.new(@operation).to_json)
    end
  end

  describe "POST create" do
    it "creates operation" do
      author = create(:user)
      subject.stub(:current_user) { author }

      new_operation = attributes_for(:operation)
      post :create, params: { operation: new_operation }
      expect(response.status).to eq(201)

      created_operation = JSON.parse(response.body)
      expect(created_operation["title"]).to eq(new_operation[:title])
      expect(created_operation["text"]).to eq(new_operation[:text])
      expect(DateTime.iso8601(created_operation["start"])).to be_within(1.second).of(new_operation[:start])
      expect(created_operation["locked"]).to eq(new_operation[:hidden])
      expect(created_operation["locked"]).to eq(new_operation[:locked])
    end
  end

  describe "PATCH update" do
    it "updates operation with new title" do
      @operation.title = "New Title"
      patch :update, params: { id: @operation.id, operation: { title: @operation.title } }
      expect(response.status).to eq(200)
      expect(response.body).to eq(ActiveModel::SerializableResource.new(@operation).to_json)
    end

    it "updates operation with new text" do
      @operation.text = "New Text"
      patch :update, params: { id: @operation.id, operation: { text: @operation.text } }
      expect(response.status).to eq(200)
      expect(response.body).to eq(ActiveModel::SerializableResource.new(@operation).to_json)
    end

    it "updates operation with new image" do
      @operation.image = "http://anrop.se/example.png"
      patch :update, params: { id: @operation.id, operation: { image: @operation.image } }
      expect(response.status).to eq(200)
      expect(response.body).to eq(ActiveModel::SerializableResource.new(@operation).to_json)
    end

    it "updates operation with new start" do
      @operation.start = DateTime.now
      patch :update, params: { id: @operation.id, operation: { start: @operation.start } }
      expect(response.status).to eq(200)
      expect(response.body).to eq(ActiveModel::SerializableResource.new(@operation).to_json)
    end

    it "updates operation with new hidden" do
      expect(@operation.hidden).to be(0)
      @operation.hidden = true
      patch :update, params: { id: @operation.id, operation: { hidden: @operation.hidden } }
      expect(response.status).to eq(200)
      expect(response.body).to eq(ActiveModel::SerializableResource.new(@operation).to_json)
    end

    it "updates operation with new locked" do
      expect(@operation.locked).to be(0)
      @operation.locked = true
      patch :update, params: { id: @operation.id, operation: { locked: @operation.locked } }
      expect(response.status).to eq(200)
      expect(response.body).to eq(ActiveModel::SerializableResource.new(@operation).to_json)
    end
  end

  describe "DELETE destroy" do
    it "deletes operation" do
      delete :destroy, params: { id: @operation.id }
      expect(response.status).to eq(204)
      expect(Operation.all).to eq([])
    end
  end
end
