class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :reset_session

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
  end

  def authenticate_inviter!
    current_user || authenticate_user!
  end

  def after_sign_in_path_for(resource)
    if resource.sign_in_count == 1 and resource.organization == nil
      new_account_path
    else
      root_path
    end
  end

  def after_invite_path_for(*)
    users_path
  end

  private

  def authorizated_roles (*roles)
    roles.any? { |role_name| User.roles[role_name] == User.roles[current_user.role] }
  end
end
