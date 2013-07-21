class UsersController < ApplicationController
  def new
    if !User.exists?
      @user = User.new
    else
      redirect_to signin_path
    end
  end

  def create
  	@user = User.new(user_params)

    # First user created should be an admin
    if !User.exists?
      @user.admin = true
    end

  	if @user.save
      sign_in @user
      redirect_to movies_path
  	else
  		render 'new'
  	end
  end

  	private
  		def user_params
  			params.require(:user).permit(:name, :email, :password, 
  				                         :password_confirmation)
  		end
end