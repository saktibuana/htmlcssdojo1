class ApplicationController < ActionController::Base
	before_action :set_current_user

	def set_current_user
		@current_user = User.find_by(id: session[:id_user])
	end

	def cek_login
		if session[:id_user] == nil
			flash[:notice] = "Anda belum login"
			redirect_to('/')
		end
	end

	def cek_is_login
		if session[:id_user] != nil
			flash[:notice] = "Anda sudah login"
			redirect_to('/')
		end
	end

end
