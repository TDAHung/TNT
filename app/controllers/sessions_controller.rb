class SessionsController < ApplicationController
  before_action :check_user_authentication, except: :destroy
  layout 'authen_application_layout'
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
  end
end
