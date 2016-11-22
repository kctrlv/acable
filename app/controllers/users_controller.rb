class UsersController < ApplicationController
  def create
    if existing_user
      attempt_login
    else
      signup
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

  def existing_user
    User.find_by(name: user_params[:name])
  end

  def attempt_login
    if existing_user.authenticate(user_params[:password])
      set_session_and_redirect(existing_user)
    else
      flash[:warning] = "Incorrect password; user #{user_params[:name]} already exists"
      redirect_to root_path
    end
  end

  def signup
    user = User.create(user_params)
    set_session_and_redirect(user)
  end

  def set_session_and_redirect(user)
    session[:user_id] = user.id
    cookies.signed[:user_id] = user.id
    redirect_to games_path
  end
end
