class SessionsController < ApplicationController
  def new
  end

  def create
    #how do we authenticate a user?
    #1. get the user obj
    #2. see if password matches
    #3. if so, log in
    #4. if not, error message
    user = User.find_by(name: params[:name])

    #don't save objects into the session,
    #only ids
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:notice] = "You've logged in!"
        redirect_to root_path
    else
      flash[:error] = "Invalid input."
      redirect_to login_path
    end

  end

  def destroy
  end
end
