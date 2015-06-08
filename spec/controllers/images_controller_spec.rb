require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let(:user) { create(:user) }
  let(:photo) { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'images', 'test.jpg'), 'image/jpg') }

  context '#create' do
    context 'when user is not logged in' do
      before { post :create, image: { file: photo } }

      it { expect(response).to redirect_to(root_path) }
    end

    context 'when user is logged in' do
      before { allow(subject).to receive(:current_user).and_return(user) }

      context 'when image is not provided' do
        before { post :create }

        it { expect(response).to redirect_to('/422.html') }
      end

      context 'when everything is all right' do
        before { post :create, image: { file: photo } }

        it { expect(response).to redirect_to(user_path(user.id)) }
      end
    end
  end
end