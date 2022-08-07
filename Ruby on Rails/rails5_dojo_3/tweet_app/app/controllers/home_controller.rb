class HomeController < ApplicationController
  before_action :must_not_login, {only: [:top]}
  
  def top
    
  end
  
  def about
    
  end
end
