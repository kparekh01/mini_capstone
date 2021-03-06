class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
    helper_method :current_user

  def authenticate_user!
      redirect_to '/login' unless current_user
  end

  def authorize_user!
    unless current_user && current_user.admin
      flash[:warning] = "Get a life!"
      redirect_to '/products'
    end
  end

end
