class UserController < ApplicationController
	before_action :cek_is_login, {only: [:add, :login, :action_login]}

	def signup
		@user = User.new(fullname: params[:fullname], username: params[:username], password: params[:password])
		@user.password_digest
		render("user/signup")
	end

	def add
		@user = User.new(fullname: params[:fullname], username: params[:username], password: params[:password])
		@user.password_digest
		if @user.save
			flash[:notice] = "User berhasil ditambahkan"
			session[:id_user] = @user.id
			redirect_to("/")
		end
	end

	def login	
	end

	def action_login
		@user = User.find_by(username: params[:username])
		if @user && @user.authenticate(params[:password])
			flash[:notice] = "Anda berhasil login"
			session[:id_user] = @user.id
			redirect_to('/')
		else
			@error_message = "Username dan password salah"
			render("user/login")
		end 
	end

	def logout
		session[:id_user] = nil
		flash[:notice] = "Anda telah logout"
		redirect_to("/")
	end

end
