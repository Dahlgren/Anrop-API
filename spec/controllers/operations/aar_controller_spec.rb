require 'rails_helper'

describe Operations::AarController do
  before(:each) do
    author = create(:user, :operation_maker)
    set_current_user(author)

    @operation = create(:operation, author_id: author.id)
    @aar = create(:aar, operation_id: @operation.id)
  end

  describe "GET index" do
    it "returns AAR items" do
      get :index, params: { operation_id: @operation.id }
      compare_response_body_with_model response, [@aar]
    end
  end

  describe "GET show" do
    it "returns AAR item" do
      get :show, params: { operation_id: @operation.id, id: @aar.id }
      compare_response_body_with_model response, @aar
    end
  end

  describe "POST create" do
    it "creates AAR item" do
      new_aar = attributes_for(:aar)
      post :create, params: { operation_id: @operation.id, aar: new_aar }
      expect(response.status).to eq(201)

      created_aar = JSON.parse(response.body)
      expect(created_aar["operation_id"]).to eq(@operation.id)
      expect(created_aar["aar_id"]).to eq(new_aar[:aar_id])
    end
  end

  describe "PATCH update" do
    it "updates AAR item with new name" do
      @aar.aar_id += 1
      patch :update, params: { operation_id: @operation.id, id: @aar.id, aar: { aar_id: @aar.aar_id } }
      expect(response.status).to eq(200)
      compare_response_body_with_model response, @aar
    end
  end

  describe "DELETE destroy" do
    it "deletes AAR item" do
      delete :destroy, params: { operation_id: @operation.id, id: @aar.id }
      expect(response.status).to eq(204)
      expect(Operations::Aar.all).to eq([])
    end
  end
end
