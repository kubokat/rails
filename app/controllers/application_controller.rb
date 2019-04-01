class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "Привет, #{current_user.name}"
      current_user.is_a?(Admin) ? admin_tests_path : root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
