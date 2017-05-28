class CalculatesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.js {render layout: false}
    end
  end

  def create
  	find_log_by_time params
  	respond_to do |format|
  		format.html
  		format.js {render layout: false}
  	end
  end

  private
  def find_log_by_time params
  	if params[:type_of_calculate] == "date"
  		date = params[:date].to_date
	   	@logs = Log.get_logs_by_date(date).paginate(:page => params[:page], :per_page => 10)
	  elsif params[:type_of_calculate] == "month"
      date = params[:date].to_date
	   	@logs = Log.get_logs_by_month(date.beginning_of_month, date.end_of_month).paginate(:page => params[:page], :per_page => 10)
	  else
	   	start_date = params[:start_date].to_date
  		end_date = params[:end_date].to_date
  		@logs = Log.get_logs_by_month(start_date, end_date).paginate(:page => params[:page], :per_page => 10)
	  end
  end
end
