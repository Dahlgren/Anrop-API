require 'rails_helper'

describe Operations::OperationsController do
  describe "guest" do
    before(:each) do
      author = create(:user, :operation_maker)

      @operation = create(:operation, author_id: author.id)
    end

    describe "GET index" do
      it "returns operations" do
        get :index
        compare_response_body_with_model response, [@operation]
      end
    end

    describe "GET upcoming" do
      before(:each) do
        @hidden_operation = create(:operation, hidden: true)
        @old_operation = create(:operation, start: DateTime.now.yesterday)
      end

      it "returns upcoming operations" do
        get :upcoming
        compare_response_body_with_model response, [@operation]
      end
    end

    describe "GET hidden" do
      before(:each) do
        @hidden_operation = create(:operation, hidden: true)
      end

      it "returns hidden operations as unauthorized" do
        expect{get :hidden}.to raise_error(CanCan::AccessDenied)
      end
    end

    describe "GET show" do
      it "returns operation" do
        get :show, params: { id: @operation.id }
        compare_response_body_with_model response, @operation
      end
    end
  end

  describe "operation maker" do
    before(:each) do
      @author = create(:user, :operation_maker)
      set_current_user(@author)

      @operation = create(:operation, author_id: @author.id)
    end

    describe "GET index" do
      it "returns operations" do
        get :index
        compare_response_body_with_model response, [@operation]
      end
    end

    describe "GET upcoming" do
      before(:each) do
        @hidden_operation = create(:operation, hidden: true)
        @old_operation = create(:operation, start: DateTime.now.yesterday)
      end

      it "returns upcoming operations" do
        get :upcoming
        compare_response_body_with_model response, [@operation]
      end
    end

    describe "GET hidden" do
      before(:each) do
        @hidden_operation = create(:operation, author_id: @author.id, hidden: true)
      end

      it "returns hidden operations" do
        get :hidden
        compare_response_body_with_model response, [@hidden_operation]
      end
    end

    describe "GET show" do
      it "returns operation" do
        get :show, params: { id: @operation.id }
        compare_response_body_with_model response, @operation
      end
    end

    describe "POST create" do
      it "creates operation" do
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
        compare_response_body_with_model response, @operation
      end

      it "updates operation with new text" do
        @operation.text = "New Text"
        patch :update, params: { id: @operation.id, operation: { text: @operation.text } }
        expect(response.status).to eq(200)
        compare_response_body_with_model response, @operation
      end

      it "updates operation with new image" do
        @operation.image = "http://anrop.se/example.png"
        patch :update, params: { id: @operation.id, operation: { image: @operation.image } }
        expect(response.status).to eq(200)
        compare_response_body_with_model response, @operation
      end

      it "updates operation with new start" do
        new_start = DateTime.now
        operation = @operation.dup
        operation.id = @operation.id
        operation.start = new_start
        patch :update, params: { id: @operation.id, operation: { start: new_start } }
        expect(response.status).to eq(200)
        compare_response_body_with_model response, @operation
      end

      it "updates operation with new hidden" do
        expect(@operation.hidden).to be(0)
        @operation.hidden = true
        patch :update, params: { id: @operation.id, operation: { hidden: @operation.hidden } }
        expect(response.status).to eq(200)
        compare_response_body_with_model response, @operation
      end

      it "updates operation with new locked" do
        expect(@operation.locked).to be(0)
        @operation.locked = true
        patch :update, params: { id: @operation.id, operation: { locked: @operation.locked } }
        expect(response.status).to eq(200)
        compare_response_body_with_model response, @operation
      end
    end

    describe "DELETE destroy" do
      it "deletes operation" do
        delete :destroy, params: { id: @operation.id }
        expect(response.status).to eq(204)
        expect(Operations::Operation.all).to eq([])
      end
    end
  end
end
