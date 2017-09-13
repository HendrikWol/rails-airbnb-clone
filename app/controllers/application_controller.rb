class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protect_from_forgery
  before_action :authenticate_user!
  protected
    def after_sign_in_path_for(resource)
       if Profile.find_by(user_id: current_user.id)
         show_profile_path
       else
         new_profile_path
       end
    end
end
