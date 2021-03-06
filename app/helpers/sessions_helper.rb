module SessionsHelper
	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
		if User.exists?
			@current_user ||= User.find_by(remember_token: remember_token)
		end
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	def signed_in_user
		unless signed_in?
			redirect_to signin_path
		end
	end

	def signed_in_admin
		unless signed_in?
			redirect_to signin_path
			return
		end
		unless current_user.is_admin?
			raise ActionController::RoutingError.new("Not Found")
		end
	end
end
