require 'rails_helper'

describe Users::SearchController do
  before(:each) do
    @user = create(:user, name: 'find_this_name')
    create(:user, name: 'other')
  end

  describe "GET index" do
    it "returns users" do
      get :index, params: { q: 'this' }
      expect(response.body).to eq(ActiveModelSerializers::SerializableResource.new([@user]).to_json)
    end
  end
end
