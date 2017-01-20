class AccountsController < ApplicationController

  def index
    render :json => Account.all.pluck_to_hash("name as text","id as value")
  end

  def create
    status = "ok"
    message = "success"

    begin
      raise "Invalid account name" if !params[:name].present?
      Account.create(name: params[:name])
      message = "Account was successfully created."
    rescue => exception
      status = "fail"
      message = exception.message
    end
    render :json => { :status => status, :message => message }
  end

end
