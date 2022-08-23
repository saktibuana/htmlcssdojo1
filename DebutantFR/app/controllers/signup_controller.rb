class SignupController < ApplicationController
  #resource :users {only [:create]}
  layout "signup"

  def index
    @user = User.new
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      image_name: "default_user.jpg",
      password: params[:password]
    )
    if @user.save
      flash[:notice] = "Akun berhasil dibua! Silahkan Login"
      redirect_to("/")
    else
      flash[:notice] = "Isilah form dengan hati-hati"
      render("signup/index")
    end
  end

end
