require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let(:user) { create(:user) }
  let(:photo) { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'images', 'test.jpg'), 'image/jpg') }

  context '#create' do
    context 'when user is not logged in' do
    end

    context 'when image is not provided' do
    end

    context 'when everything is all right' do
      before { allow(subject).to receive(:current_user).and_return(user) }
      before { post :create, image: { file: photo } }

      it { expect(response).to redirect_to(user_path(user.id)) }
    end
  end
end
