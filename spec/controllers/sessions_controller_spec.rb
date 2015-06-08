require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create(:user) }

  context '#create' do
    let(:auth_hash) {
      {
        'provider' => 'vkontakte',
        'uid' => 'uid',
        'info' => {
          'email' => 'email@email.email',
          'name' => 'Manukyan Karen',
          'image' => 'image_url.com'
        }
      }
    }

    context 'when user is already signed in' do
      before { session[:user_id] = user.id }
      context 'when everything is ok' do
        before { request.env['omniauth.auth'] = auth_hash }
        before { get :create, provider: 'vkontakte' }

        it { expect(SocialProfile.count).to eq 1 }
        it { expect(session[:user_id]).not_to eq user.id }
        it { expect(response).to redirect_to(user_path(session[:user_id])) }
      end

      context 'when something is wrong' do
        before { get :create, provider: 'vkontakte' }

        it { expect(SocialProfile.count).to eq 0 }
        it { expect(response).to redirect_to('/422.html') }
      end
    end

    context 'when user is not signed in' do
    end
  end
end