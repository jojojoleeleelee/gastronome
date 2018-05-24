class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    require_logged_in
  end

  def new
    @user = User.new
  end

  def create
    user = params[:user]
    if user[:password] != user[:password_confirmation]
      redirect_to new_user_path, notice:  "Your password confirmation doesn't match."
      return
    end

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome to GASTRONOME, #{@user.username.upcase}!"
    else
      redirect_to new_user_path, notice: "Try a different username or email."
    end
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
