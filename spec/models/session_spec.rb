require "cancan/matchers"

describe "Session" do

  before(:each) do
    @username = "username"
    @password = "password"

    @user = create(:user)
    @user.name = @username
    @user.algorithm = "sha256"
    @user.salt = "salt"
    @user.password = @user.hash_password(@password)
    @user.save
  end

  describe "login" do
    context "when passed correct username and password" do
      before (:each) do
        @session = Session.new({
          username: @username,
          password: @password,
        })
        @login_result = @session.login
      end

      it "returns succesful login" do
        expect(@login_result).to be true
      end

      it "should generates token" do
        expect(@session.token).not_to be_nil
      end

      it "should match user" do
        expect(@session.user).to eql(@user)
      end
    end

    context "when passed incorrect username and password" do
      before (:each) do
        @session = Session.new({
          username: "incorrect username",
          password: "incorrect password",
        })
        @login_result = @session.login
      end

      it "returns non succesful login" do
        expect(@login_result).to be false
      end

      it "does not generates token" do
        expect(@session.token).to be_nil
      end

      it "does not match user" do
        expect(@session.user).not_to eql(@user)
      end
    end
  end
end
