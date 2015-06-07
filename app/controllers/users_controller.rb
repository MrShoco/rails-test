class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @image = Image.new
    @link = Link.new
  end
end
