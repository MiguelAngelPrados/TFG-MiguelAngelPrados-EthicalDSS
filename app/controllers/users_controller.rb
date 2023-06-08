class UsersController < ApplicationController

  before_action :authenticate, :admin_permissions

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to patients_path, notice: "You created a new user"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :admin)
  end


end
