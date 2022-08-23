class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :access, {only: [:edit, :destroy, :update]}
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes = Like.find_by(post_id: @post.id, user_id: @current_user.id)
    @like_count = Like.where(post_id: @post.id).count
    
    if @like_count > 0
      @count = @like_count
    else 
      @count = 0
    end
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
  
  def access
    @post = Post.find_by(id: params[:id])
    if @current_user.id != @post.user_id
      flash[:notice] = "Unauthorized access"
      redirect_to("/posts/index")
    end
  end
  
end
