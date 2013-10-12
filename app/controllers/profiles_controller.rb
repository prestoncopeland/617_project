class ProfilesController < ApplicationController
  
  def show
    @profile = Profile.find(params[:id])
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
		if @profile.save
			flash[:success] = "Profile created"
			redirect_to profiles_path
		else
			render 'new'
		end
  end

  def index
  	@profiles = Profile.all
  end

  private

  def profile_params
    params.require(:profile).permit(:username, :first_name, :last_name,
         :email, :country, :time_zone, :native_language, :blog_url, :description, :avatar)
  end
end
