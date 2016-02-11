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
end
