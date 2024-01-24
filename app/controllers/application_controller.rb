class ApplicationController < ActionController::Base
  before_action :set_user
  protected
    def check_user_authentication
      if session[:user_id].nil? && !on_sign_in_path?
        redirect_to sign_in_path
      elsif session[:user_id].present? && on_sign_in_path?
        redirect_to root_path
      end
    end

    def on_sign_in_path?
      request.path == sign_in_path
    end

  protected
    def set_user
      if !session[:user_id].nil?
        @current_user = User.find(session[:user_id])
      end
    end
end
