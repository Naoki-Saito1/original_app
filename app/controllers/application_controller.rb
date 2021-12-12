class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [profile_attributes: [:name] ])
  end
  
  def after_sign_in_path_for(resource)
     profile_path(current_user.profile.id)
  end
  
  private

  def layout_by_resource
    if devise_controller?
      'top'
    else
      'application'
    end
  end
end
