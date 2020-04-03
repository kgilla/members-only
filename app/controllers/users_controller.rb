class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Welcome to the club!'
      log_in @user
      redirect_to root_url
    else
      flash[:danger] = 'You made a mistake somewhere...'
      render 'new'
    end
  end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation) 
    end
end
