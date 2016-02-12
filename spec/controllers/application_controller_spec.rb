require 'rails_helper'

describe ApplicationController do
  before(:each) do
    @user = create(:user)
  end

  describe "authenticate_user" do
    it "returns correct user for valid cookie" do
      expiration = Time.now.to_i + 1.day.seconds
      hash = @user.authenticate_hash(expiration)
      @request.cookies[:fusionGppEM_user] = "#{@user.user_id}.#{expiration}.#{hash}"
      expect(subject.authenticate_user).to eql(@user)
    end

    it "returns nil for invalid cookie" do
      expiration = Time.now.to_i + 1.day.seconds
      hash = @user.authenticate_hash(expiration) + "incorrect"
      @request.cookies[:fusionGppEM_user] = "#{@user.user_id}.#{expiration}.#{hash}"
      expect(subject.authenticate_user).to be_nil
    end
  end
end
