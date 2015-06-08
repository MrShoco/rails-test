class SessionsController < ApplicationController
  def create
    @current_user = UserOauthService.find_or_create(auth_hash)

    if @current_user.present?
      session[:user_id] = @current_user.id
      redirect_to user_path(@current_user.id)
    else
      redirect_to '/422.html'
    end
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
