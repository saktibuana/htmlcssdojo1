class UsersController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "pass", except: [:index, :signup, :credential, :show]

  def index
    @users = User.all
  end
  
  def signup
  end

  def credential
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(name: params[:name], email: params[:email])
    @user.image_name = "default_user.jpg"
    @user.save
    flash[:notice] = "Successfully created user."
    redirect_to("/users/#{@user.id}")
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
      flash[:notice] = "Successfully updated user."
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully deleted user."
    redirect_to("/users")
  end

end
