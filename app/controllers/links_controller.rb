class LinksController < ApplicationController
  before_filter :require_login
  before_filter :link_provided

  def create
    link = Link.new(permit_params)

    if link.save
      redirect_to user_path(current_user.id)
    else
      redirect_to '/422.html'
    end
  end

  def permit_params
    params[:link][:user_id] = current_user.id
    params.require(:link).permit(:url, :description, :user_id)
  end

  def link_provided
    redirect_to '/422.html' if params[:link].blank?
  end
end
