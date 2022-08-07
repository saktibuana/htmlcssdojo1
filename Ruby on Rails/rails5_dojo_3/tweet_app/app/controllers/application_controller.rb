class ApplicationController < ActionController::Base
  def must_login
    @user = User.find_by(id: session[:user_id])
    if @user == nil
      flash[:notice] = "You must be logged in"
      redirect_to("/login")
    end
  end  
  
  def must_not_login
    @user = User.find_by(id: session[:user_id])
    if @user 
      flash[:notice] = "You are already logged in"
      redirect_to("/posts/index")
    end
  end
  
  
end
