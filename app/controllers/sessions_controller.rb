class SessionsController < ApplicationController
  def create
    @current_user = UserOauthService.find_or_create(auth_hash)
    session[:user_id] = @current_user.id

    redirect_to user_path(@current_user.id)
  end

  def destroy
    reset_session

    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
