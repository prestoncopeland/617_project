class ApplicationController < ActionController::Base
  #before_action :reset_session
  def forem_user
    current_user
  end
  helper_method :forem_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #dum dum dum change
  protect_from_forgery with: :exception

  #this makes the methods avail through the app
  helper_method :current_user, :logged_in?, :require_user
  def current_user
    # if there's an authenticated user,
    #return the user obj, else return nil
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user #returns boolean
  end

  def require_user
    if !logged_in?
      flash[:error] = "You must be logged in."
      redirect_to root_path
    end
  end

  def require_teacher
    if current_user and current_user.is_teacher?
      return true
    else
      flash[:error] = "Access Denied"
      redirect_to root_path
    end
  end
end
