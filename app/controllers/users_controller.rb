class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @user = current_user
  end

  def show
    @user = current_user
    if @user.avatar.attached? == false
      @user.avatar.attach(params[:avatar])
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_profile_path(@user)
    else
      render "edit"
    end
  end

  def destroy
  end

  def profile
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :avatar)
  end
end
