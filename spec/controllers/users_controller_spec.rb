require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let(:user) { create(:user) }

  before { allow(subject).to receive(:current_user).and_return(user) }

  context "#index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  context "#show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
