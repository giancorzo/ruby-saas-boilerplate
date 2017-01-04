class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action except: [:profile] do
    check_allowed_roles(current_user, ["admin"])
  end

  before_action only: [:profile] do
    check_allowed_roles(current_user,["interviewer","approver","hmanager","admin"])
  end

  after_filter "save_my_previous_url", only: [:new,:edit]

  def save_my_previous_url
    # session[:previous_url] is a Rails built-in variable to save last url.
    session[:my_previous_url] = URI(request.referer || '').path
  end

  def index
    @users = User.all
  end

  def profile
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.invite_guest!({:email => params[:user][:email],
                                :name => params[:user][:name],
                                :role => params[:user][:role]},
                               current_user, params[:message])
    respond_to do |format|
       if @user.persisted?
         format.html { redirect_to session[:my_previous_url], notice: 'User was successfully created.' }
       else
         format.html { render :new }
       end
     end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to session[:my_previous_url], notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email,:password, :avatar, :role, :name,:password_confirmation)
    end
end
