class DashboardController < ApplicationController

  before_action do
    check_allowed_roles(current_user, ["interviewer","approver","hmanager","admin"])
  end
    
  def index
  end
end
