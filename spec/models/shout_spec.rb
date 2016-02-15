require "cancan/matchers"

describe "Shout" do
  describe "abilities" do
    subject(:ability){ Ability.new(user) }

    context "when user is an guest" do
      let(:user){ nil }

      it{ should be_able_to(:read, create(:shout)) }
    end

    context "when user is registered" do
      let(:user){ create(:user) }

      it{ should be_able_to(:read, create(:shout, user_id: 0)) }
      it{ should be_able_to(:read, create(:shout, user_id: user.id)) }
      it{ should be_able_to(:create, build(:shout)) }
      it{ should be_able_to(:update, create(:shout, user_id: user.id)) }
      it{ should be_able_to(:destroy, create(:shout, user_id: user.id)) }
    end
  end
end
