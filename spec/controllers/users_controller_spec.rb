require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  context "#index" do
    context 'when there are no users' do
      before { get :index }

      it { expect(response).to render_template(:index) }
      it { expect(assigns(:users)).to be_empty }
    end

    context 'when there are some users' do
      let(:users) { create_list(:user, 10) }

      before { get :index }

      it { expect(assigns(:users)).to match users }
    end
  end

  context "#show" do
    let(:user) { create(:user) }

    context 'when there are no users' do
      before { get :show, id: user.id }

      it { expect(response).to render_template(:show) }
      it { expect(assigns(:user)).to eq user }
    end
  end

end
