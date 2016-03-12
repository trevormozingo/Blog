class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.password != @user.passwordConfirmation
      redirect_to :controller => 'welcome', :action => 'home' 
    else
      if @user.save
        log_in @user
        redirect_to :controller => 'welcome', :action => 'home' 
      else
        redirect_to :controller => 'welcome', :action => 'index' 
      end
    end
  end

  def update
    if @user.update(user_params)
      redirect_to :controller => 'welcome', :action => 'home' 
    else
      redirect_to :controller => 'welcome', :action => 'index' 
    end
  end

  def destroy
    @user.destroy
    redirect_to :controller => 'welcome', :action => 'home' 
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :passwordConfirmation, :AdminId)
    end
end




















