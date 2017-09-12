class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new

  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to apartment_index_path
    else
      render :new
    end
  end

  def edit
  end

  def update
      if @profile.update(profile_params)
        format.html { redirect_to @restaurant, notice: 'Profile was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @profile.destroy
    redirect_to apartment_index_path
  end


  private
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :user_id)
  end

end
