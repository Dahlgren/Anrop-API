require "cancan/matchers"

describe "User" do

  before(:each) do
    @user = create(:user)
  end

  describe "avatar" do
    context "when user has an avatar" do
      before (:each) do
        @user.avatar = "my_avatar.jpg"
      end

      it "returns url" do
        expect(@user.avatar_url).to eq("https://www.anrop.se/images/avatars/my_avatar.jpg")
      end
    end

    context "when user has no avatar" do
      it "returns url" do
        expect(@user.avatar_url).to eq("https://www.anrop.se/images/avatars/noavatar100.png")
      end
    end
  end
end
