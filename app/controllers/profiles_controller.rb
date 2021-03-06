class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end

  def my_profile
    @profile = current_user.profile
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save!
      redirect_to apartments_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to show_profile_path, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to apartments_path
  end


  private
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :user_id, :date_of_birth, :phone_number, :description, :photo, :photo_cache)
  end

end
