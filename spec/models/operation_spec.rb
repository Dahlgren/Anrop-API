require "cancan/matchers"

describe "Operation" do
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
      it{ should be_able_to(:create, Operation.new) }
      it{ should be_able_to(:update, create(:operation, author_id: user.id)) }
      it{ should be_able_to(:destroy, create(:operation, author_id: user.id)) }
    end
  end
end
