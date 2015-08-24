class UsersController < ApplicationController
  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in!(@user)
      redirect_to root_url
    else
      flash[:errors] = @user.errors
      redirect_to new_user_url
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :birthdate,
        :phone_number)
    end
end
