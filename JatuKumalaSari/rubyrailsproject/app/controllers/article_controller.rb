class ArticleController < ApplicationController
  before_action :authenticate_user

  def index
    @articles = Article.all
  end

  def read
    @article = Article.find_by(id: params[:id])
  end
end
