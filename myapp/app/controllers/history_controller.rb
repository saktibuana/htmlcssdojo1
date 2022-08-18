class HistoryController < ApplicationController

  before_action :cek_login, {only: [:add, :action_add] }

  def add
    @history = @history = History.new(title: params[:title],
      desc: params[:desc], 
      incident_date: params[:incident_date],
      post_by: @current_user.id)
    render("history/add")
  end

  def action_add
  	@history = History.new(title: params[:title],
  		desc: params[:desc], 
  		incident_date: params[:incident_date],
  		post_by: @current_user.id)
  	if @history.save
  		flash[:notice] = "Berhasil menambahkan data"
  	   redirect_to("/")
  	else
  		@error_message = "Gagal menambahkan data"
      render("history/add")
  	end
  end

  def detail
    @history = History.find_by(id: params[:id])
  end

  def edit
    @history = History.find_by(id: params[:id])
  end

  def action_edit
    @history = History.find_by(id: params[:id])
    @history.title = params[:title]
    @history.desc = params[:desc]
    @history.incident_date = params[:incident_date]

    if @history.save
      redirect_to("/history/#{@history.id}/detail")
    end
  end
end
