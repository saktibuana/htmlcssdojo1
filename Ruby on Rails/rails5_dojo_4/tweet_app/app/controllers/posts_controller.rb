class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :tidak_punya_akses, {only: [:edit, :update, :destroy]}
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @hitung = Like.where(post_id: @post.id).count
    
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(content: params[:content], user_id: @current_user.id)
    if @post.save
      flash[:notice] = "Post successfully created"
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
      flash[:notice] = "Post successfully edited"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "Post successfully deleted"
    redirect_to("/posts/index")
  end
  
  def tidak_punya_akses
    @post = Post.find_by(id: params[:id])
    if @current_user.id != @post.user_id
    flash[:notice] = "Unauthorized access"
    redirect_to("/posts/index")
  end
end
  
end
