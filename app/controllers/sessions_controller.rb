class SessionsController < ApplicationController

  def new
  end

  def create
    binding.pry
    if request.env['omniauth.auth']
      user = User.find_by(email: request.env['omniauth.auth']['info']['email'])
      if !user
        flash[:notice] = "Email does not match."
        redirect_to sessions_create_path
      else
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome back to Gastronome!"
      end
    else
        @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "Welcome back to Gastronome!"
      else
        redirect_to new_user_path
      end
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def auth
    params[:format]
  end
end
