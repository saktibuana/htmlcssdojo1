class HomeController < ApplicationController
  before_action :authenticate_user

  def index
    @contestants = Contestant.all.order(created_at: :desc)
  end

  def contestant
    @contestants = Contestant.all
  end

  def create
    @contestant = Contestant.new(name: params[:name], age: params[:age])

    if @contestant.save
      flash[:notice] = "Berhasil mendaftar!"
      redirect_to("/contestant")
    else
      render("home/index")
    end
  end
end
