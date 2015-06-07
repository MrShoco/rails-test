class ImagesController < ApplicationController
  def create
    return redirect_to root_path if !signed_in?

    url = upload

    Image.create(permit_params(url))

    redirect_to user_path(current_user.id)
  end

  private

  def upload
    uploaded_io = params[:image][:file]
    File.open(Rails.root.join('app', 'assets', 'images', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    uploaded_io.original_filename
  end

  def permit_params(url)
    params[:image][:user_id] = current_user.id
    params[:image][:url] = url
    params.require(:image).permit(:url, :description, :user_id)
  end
end
