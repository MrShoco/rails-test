class LinksController < ApplicationController
  before_filter :require_login

  def create
    Link.create(permit_params)

    redirect_to user_path(current_user.id)
  end

  def permit_params
    params[:link][:user_id] = current_user.id
    params.require(:link).permit(:url, :description, :user_id)
  end
end
