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
  		date = set_date(params[:date])
	   	@logs = Log.get_logs_by_date date
	elsif params[:type_of_calculate] == "month"
		date = set_date(params[:date])
	   	@logs = Log.get_logs_by_month date.beginning_of_month, date.end_of_month
	else
	   	start_date = set_date(params[:start_date])
  		end_date = set_date(params[:end_date])
  		@logs = Log.get_logs_by_month start_date, end_date
	end
  end

  def set_date param
  	day = param[:day].to_i
  	month = param[:month].to_i
  	year = param[:year].to_i
  	Date.new year, month, day
  end
end
