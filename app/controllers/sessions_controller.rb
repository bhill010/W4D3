class SessionsController < ApplicationController
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
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      @user.reset_session_token!
      login(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = ["Invalid Credentials"]
      render :new
    end

  end

  def destroy
    if current_user
      current_user.reset_session_token!
      logout
      session[:session_token] = nil
      redirect_to new_session_url
    else
      flash[:errors] = ["Please login"]
      redirect_to new_users_url
    end
  end
end
