class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end
  
  def new
    @post = Post.new
  end
  
  def create
    if params[:post_image]
      nama_file_post_image = "post_image_#{Time.now.to_i}.jpg"
      post_image = params[:post_image]
      File.binwrite("public/post_images/#{nama_file_post_image}", post_image.read)
    else
      nama_file_post_image ="default_post.jpg"
    end
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id,
      post_image: nama_file_post_image
    )
    if @post.save
      flash[:notice] = "Aspirasi Berhasil Diutarakan"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if params[:post_image]
      @post.post_image = "post_image_#{Time.now.to_i}.jpg"
      post_image = params[:post_image]
      File.binwrite("public/post_images/#{@post.post_image}", post_image.read)
    end
    if @post.save
      flash[:notice] = "Aspirasi Berhasil Diubah"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "Aspirasi Berhasil Dihapus"
    redirect_to("/posts/index")
  end
  
  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "Anda Tidak Dapat Hak Akses"
      redirect_to("/posts/index")
    end
  end
  
end
