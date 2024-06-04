class SessionsController < ApplicationController
  def new
    # Renders the login form
  end

  def create
    # Authenticates the user and creates a session
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to places_path, notice: 'Logged in successfully!'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    # Logs out the user by clearing the session
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out successfully!'
  end
end
