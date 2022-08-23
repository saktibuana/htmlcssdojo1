class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:show, :index, :edit, :update]}
  before_action :forbid_login, {only: [:new, :login_form, :create, :login]}
  before_action :correct_user, {only: [:edit, :update]}
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @id_current = @current_user.id
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(name: params[:name], email: params[:email], image_name: "default_user.jpg", password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have signed up successfully"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    
   if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    
    if @user.save
      flash[:notice] = "Your account has been updated successfully"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end
  
  def login_form
  end
  
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "You have logged in successfully"
      redirect_to("/posts/index")
    else
      @error_message = "Wrong email or password"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "You have logged out successfully"
    redirect_to("/login")
  end
  
  def correct_user
    if params[:id].to_i != @current_user.id
      flash[:notice] = "Unauthorized access"
      redirect_to("/posts/index")
    end
  end
  
end
