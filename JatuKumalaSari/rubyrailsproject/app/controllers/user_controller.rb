class UserController < ApplicationController
  before_action :forbid_login_user, {only: [:signup, :create]}

  def signup
    @user = Member.new
  end

  def show
    @user = Member.find_by(id: params[:id])
  end

  def create
    @user = Member.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Berhasil melakukan pendaftaran!"
      redirect_to("/user/#{@user.id}")
    else
      render("user/signup")
    end
  end

  def login

  end

  def login_form
    @user = Member.find_by(email: params[:email], password: params[:password])

    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Berhasil login"
      redirect_to("/")
    else
      @error_message = "Invalid email/password"
      @email = params[:email]
      @password = params[:password]
      render("user/login")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "You have logged out successfully"
    redirect_to("/")
  end
end
