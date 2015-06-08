require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  let(:user) { create(:user) }
  let(:url) { Faker::Internet.url }

  context '#create' do
    context 'when user is not logged in' do
      before { post :create, link: { url: url } }

      it { expect(response).to redirect_to(root_path) }
    end

    context 'when user is loggend in' do
      before { allow(subject).to receive(:current_user).and_return(user) }

      context 'when link is not provided' do
        before { post :create }

        it { expect(response).to redirect_to('/422.html') }
      end

      context 'when everything is all right' do
        before { post :create, link: { url: url } }

        it { expect(response).to redirect_to(user_path(user.id)) }
      end
    end
  end
end
