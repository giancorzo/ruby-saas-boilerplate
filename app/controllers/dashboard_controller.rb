class DashboardController < ApplicationController

  before_action do
    check_allowed_roles(current_user, ["interviewer","approver","hmanager","admin"])
  end

  def index
    @job_position = JobPosition.includes(:account).all.pluck_to_hash(:id,"accounts.name as account",:title,:status)
  end
end
