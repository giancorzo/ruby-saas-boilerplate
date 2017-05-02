class DashboardController < ApplicationController

  before_action { authorizated_roles(:user, :admin) }

  def index
  end
end
