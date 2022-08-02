class PostsController < ApplicationController
  # GET /posts
  def index
     @posts = Post.all.order(created_at: :desc)
  end
  
  def show
     @post = Post.find_by(id: params[:id])
  end
end
