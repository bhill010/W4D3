class UsersController < ApplicationController
  before_action :require_check, only: [:new, :create]

  def require_check
    if current_user
      flash[:error] = "You are logged in already."
      redirect_to cats_url
    end
  end

  def new
    render :new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user)
      .permit(:username, :password)
  end
end
