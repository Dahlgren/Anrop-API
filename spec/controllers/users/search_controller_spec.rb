require 'rails_helper'

describe Users::SearchController do
  before(:each) do
    @user = create(:user, name: 'find_this_name')
    create(:user, name: 'other')
  end

  describe "GET index" do
    it "returns users" do
      get :index, params: { q: 'this' }
      compare_response_body_with_model response, [@user]
    end
  end
end
