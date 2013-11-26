class UsersController < ApplicationController
  before_filter :require_user, :except => [:new, :create, :to_s]
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

  def schedules
    if current_user.is_teacher?
      @schedules = PrivateForum.all.select { |pf| pf.teacher == current_user }
    else
      @schedules = current_user.private_forums
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :email, :teacher)
  end
end
