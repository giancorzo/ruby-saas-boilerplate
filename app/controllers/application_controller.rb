class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_allowed_roles user, allowed_roles
    if !allowed_roles.include? user.role
      redirect_to root_path
      return
    end
  end
end
