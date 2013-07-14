class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

    # First user created should be an admin
    if not User.exists?
      @user.admin = true
    end

  	if @user.save
  		render text: "#{@user.name} created!"
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