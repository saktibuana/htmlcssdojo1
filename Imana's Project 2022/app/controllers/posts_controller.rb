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
    
    # Time.now.utc.to_formatted_s(:number)
    # menambah upload gambar
    if params[:image] 
      namafile="gambar_#{Time.now.to_i }.jpg" 
      image = params[:image]
      File.binwrite("public/post_images/#{namafile}", image.read)
    else
      namafile="gambar.jpg"

    end
    # end menambah upload gambar
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id,
      gambar: namafile
    )
    if @post.save
      flash[:notice] = "Wisdom berhasil dibuat"
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
    if @post.save
      flash[:notice] = "Wisdom berhasil diubah"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "Wisdom berhasil dihapus"
    redirect_to("/posts/index")
  end
  
  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "Anda tidak memiliki ijin akses"
      redirect_to("/posts/index")
    end
  end
  
end
