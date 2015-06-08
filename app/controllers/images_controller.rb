class ImagesController < ApplicationController
  before_filter :require_login

  def create
    return redirect_to '422.html' if params[:image].blank?

    url = upload(params[:image][:file])

    image = Image.new(permit_params(url))

    if image.save
      redirect_to user_path(current_user.id)
    else
      redirect_to '422.html'
    end
  end

  private

  def upload(upload_io)
    begin
      url = SecureRandom.hex
    end while(Image.exists?(url: url))

    File.open(Rails.root.join('app', 'assets', 'images', url), 'wb') do |file|
      file.write(upload_io.read)
    end

    url
  end

  def permit_params(url)
    params[:image][:user_id] = current_user.id
    params[:image][:url] = url
    params.require(:image).permit(:url, :description, :user_id)
  end
end
