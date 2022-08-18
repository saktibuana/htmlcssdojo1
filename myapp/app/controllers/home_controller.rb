class HomeController < ApplicationController
  def index
  	# @histories = History.where("(id % 2) > 0").all.order(incident_date: :asc)
  	# @histories2 = History.where("(id % 2) = 0").all.order(incident_date: :asc)
  	@histories = History.all.order(incident_date: :asc)
  end
end
