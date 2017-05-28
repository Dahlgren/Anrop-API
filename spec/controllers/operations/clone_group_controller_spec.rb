require 'rails_helper'

describe Operations::CloneGroupController do
  describe "guest" do
    before(:each) do
      author = create(:user, :operation_maker)

      @operation = create(:operation, author_id: author.id)
      @group = create(:group, operation_id: @operation.id)
      @empty_slot = create(:slot, group_id: @group.id, name: "Empty")
    end

    describe "POST create" do
      it "rejects cloning group" do
        expect{ post :clone, params: { operation_id: @operation.id, group_id: @group.id } }.to raise_error(CanCan::AccessDenied)
      end
    end
  end

  describe "author" do
    before(:each) do
      author = create(:user, :operation_maker)
      set_current_user(author)

      @operation = create(:operation, author_id: author.id)
      @group = create(:group, operation_id: @operation.id)
      @empty_slot = create(:slot, group_id: @group.id, name: "Empty")
      @taken_slot = create(:slot, group_id: @group.id, name: "Taken", user_id: author.id)
    end

    describe "POST create" do
      it "creates group" do
        post :clone, params: { operation_id: @operation.id, group_id: @group.id }
        expect(response.status).to eq(201)

        created_group = JSON.parse(response.body)
        expect(created_group["id"]).to_not eq(@group.id)
        expect(created_group["operation_id"]).to eq(@operation.id)
        expect(created_group["name"]).to eq(@group.name)
        expect(created_group["order"]).to eq(1)

        new_group = Operations::Group.find(created_group["id"])
        expect(new_group.operation_id).to eq(@operation.id)
        expect(new_group.name).to eq(@group.name)

        new_slots = new_group.slots

        new_empty_slot = new_slots.first
        expect(new_empty_slot.id).to_not eq(@empty_slot.id)
        expect(new_empty_slot.name).to eq(@empty_slot.name)
        expect(new_empty_slot.user_id).to be_nil

        new_taken_slot = new_slots.last
        expect(new_taken_slot.id).to_not eq(@taken_slot.id)
        expect(new_taken_slot.name).to eq(@taken_slot.name)
        expect(new_taken_slot.user_id).to be_nil
      end
    end
  end

  describe "another operation maker" do
    before(:each) do
      author = create(:user, :operation_maker)
      another_maker = create(:user, :operation_maker)
      set_current_user(another_maker)

      @operation = create(:operation, author_id: author.id)
      @group = create(:group, operation_id: @operation.id)
      @empty_slot = create(:slot, group_id: @group.id, name: "Empty")
    end

    describe "POST create" do
      it "rejects cloning group" do
        expect{ post :clone, params: { operation_id: @operation.id, group_id: @group.id } }.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
