require "cancan/matchers"

describe "Operations::Operation" do
  describe "abilities" do
    subject(:ability){ Ability.new(user) }

    context "when user is an guest" do
      let(:user){ nil }

      it{ should be_able_to(:read, create(:operation, hidden: false)) }
      it{ should_not be_able_to(:read, create(:operation, hidden: true)) }
    end

    context "when user is operation maker" do
      let(:user){ create(:user, :operation_maker) }

      it{ should be_able_to(:read, create(:operation, hidden: false)) }
      it{ should_not be_able_to(:read, create(:operation, hidden: true)) }

      it{ should be_able_to(:read, create(:operation, author_id: user.id)) }
      it{ should be_able_to(:create, build(:operation)) }
      it{ should be_able_to(:update, create(:operation, author_id: user.id)) }
      it{ should be_able_to(:destroy, create(:operation, author_id: user.id)) }
    end
  end

  describe "participants" do
    before(:each) do
      @user = create(:user, :operation_maker)
      @operation = create(:operation, author_id: @user.id)
      @group = create(:group, operation_id: @operation.id)
    end

    describe "when there are no slots" do
      it "should have no participants" do
        expect(@operation.number_of_participants).to eq(0)
      end

      it "should have no slots" do
        expect(@operation.number_of_slots).to eq(0)
      end

      it "shouldn't have user participating" do
        expect(@operation.participating?(@user)).to be false
      end
    end

    describe "when there is one untaken slot" do
      before(:each) do
        @slot = create(:slot, group_id: @group.id)
      end

      it "should have no participants" do
        expect(@operation.number_of_participants).to eq(0)
      end

      it "should have one slots" do
        expect(@operation.number_of_slots).to eq(1)
      end

      it "shouldn't have user participating" do
        expect(@operation.participating?(@user)).to be false
      end
    end

    describe "when there is one taken slot" do
      before(:each) do
        @slot = create(:slot, group_id: @group.id, user_id: @user.id)
      end

      it "should have one participant" do
        expect(@operation.number_of_participants).to eq(1)
      end

      it "should have one slots" do
        expect(@operation.number_of_slots).to eq(1)
      end

      it "should have user participating" do
        expect(@operation.participating?(@user)).to be true
      end
    end
  end
end
