class AccountsController < ApplicationController

  def new
    @account = Account.new
    render layout: 'devise'
  end

  def create
    @account = Account.new(account_params)
    @account.owner = current_user
    respond_to do |format|
      if @account.save
        current_user.organization = @account
        current_user.role = User.roles[:admin]
        if current_user.save
          format.html { redirect_to root_path, notice: 'Required information save successfully.' }
        else
          format.html { render :new }
        end
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def destroy

  end

  private

  def account_params
    params.require(:account).permit(:name, :website_url)
  end
end
