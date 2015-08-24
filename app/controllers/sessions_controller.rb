class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user =
      User.find_by_credentials(params[:user][:email], params[:users][:password])
    if user
      log_in!(user)
      redirect_to root_url
    else
      flash[:errors] = [["Email/password combination", ["is invalid."]]]
      redirect_to new_session_url
    end
  end

  def destroy
    log_out!
    redirect_to root_url
  end
end
