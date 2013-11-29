class ProfilesController < ApplicationController

  before_action :require_user

  def show
    @user = current_user
    @profile = @user.profile
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile was successfully updated."
      redirect_to @profile
    else
      render 'edit'
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to profiles_url
  end

  def new
  	@profile = Profile.new
  end

  def create
  	@profile = Profile.new(profile_params)
    @profile.user = current_user
		if @profile.save
			flash[:success] = "Profile created"
			redirect_to profiles_path
		else
			render 'new'
		end
  end

  def index
    @users = User.where("teacher = ?", false).collect(&:id)
  	@profiles = Profile.find_all_by_user_id(@users)
  end

  private

  def profile_params
      params.require(:profile).permit(:user_id, :username, :first_name, :last_name,
        :email, :country, :time_zone, :native_language, :blog_url, :description, :avatar, :address, :sec_q_1, :sec_q_2, :sec_q_3, :sec_a_1, :sec_a_2, :sec_a_3, :date_of_birth)
  end
end
