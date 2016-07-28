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

  describe "hash_password" do
    describe "md5" do
      before(:each) do
        @user.algorithm = "md5"
      end

      it "returns double hashed md5 password" do
        expect(@user.hash_password("password")).to eq("696d29e0940a4957748fe3fc9efd22a3")
      end
    end

    describe "sha256" do
      before(:each) do
        @user.algorithm = "sha256"
      end
      
      it "returns salted and hashed password" do
        @user.salt = "salt"
        expect(@user.hash_password("password")).to eq("84ec44c7d6fc41917953a1dafca3c7d7856f7a9d0328b991b76f0d36be1224b9")
      end
    end
  end
end
