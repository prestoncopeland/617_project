class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "You are registered."
      redirect_to root_path
    else
      render :new
    end
  end

  def to_s
    name
  end

  def show
    @user = current_user
  end


  private
  # Using a private method to encapsulate the permissible parameters is just a good pattern
  # since you'll be able to reuse the same permit list between create and update. Also, you
  # can specialize this method with per-user checking of permissible attributes.
  def user_params
    params.require(:user).permit(:name, :password, :email, :teacher)
  end
end
