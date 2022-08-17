class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      image_name: "default_user.jpg"
    )
    if @user.save
      flash[:notice] = "Anda telah berhasil mendaftar"
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
    # Tambahkan code untuk menyimpan gambar
    @user.image_name = "#{user.id}.jpg"
    @user.image_name = params[:image]
    File.binwrite("public/user_images/#{@user.image_name}", image.read)
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
        image = params[:image]
        File.binwrite("public/user_images/#{@user.image_name}", image.read)
      end
      
    
    if @user.save
      flash[:notice] = "Akun Anda telah berhasil diperbarui"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end
  
end
