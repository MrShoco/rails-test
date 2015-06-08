class LinksController < ApplicationController
  before_filter :require_login

  def create
    link = Link.new(permit_params)

    if link.save
      redirect_to user_path(current_user.id)
    else
      redirect_to '422.html'
    end
  end

  def permit_params
    params[:link][:user_id] = current_user.id
    params.require(:link).permit(:url, :description, :user_id)
  end
end
