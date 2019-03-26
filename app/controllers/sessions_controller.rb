class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      if cookies[:path]
        redirect_to cookies[:path]
        cookies.delete :path
      else
        redirect_to root_path
      end

    else
      flash.now[:alert] = "Are you are Guru?"
      render :new
    end
  end

  def singout
    session.clear
    redirect_to root_path
  end
end
