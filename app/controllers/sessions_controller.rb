class SessionsController < ApplicationController
  
  def new

  end

  def create
    @user = User.find_by name: params[:name]
    if @user && @user.authenticate(params[:password])
      login(@user)
      redirect_to root_path, notice: "Logged in"
    else
      redirect_to login_path, alert: "Invalid name or password"
    end
  end

  def destroy
    logout
    redirect_to patients_path, notice: "Logged out."
  end




end
