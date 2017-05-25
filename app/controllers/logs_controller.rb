class LogsController < ApplicationController
  before_action :find_log, except: [:index, :new, :create]
  before_action :list_logs, only: [:index, :destroy, :create]

  def index
    @logs = Log.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @log = Log.new
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  def create
    @log = Log.new log_params
    if @log.save
      @logs = Log.paginate(:page => params[:page], :per_page => 10)
      respond_to do |format|
        format.js {render layout: false}
      end
    end
  end

  def update
    @log.update_attributes log_params
    @logs = Log.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  def edit
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  def destroy
    @log.destroy
    @logs = Log.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html {redirect_to logs_path, notice: t("log.destroy")}
      format.js {render layout: false}
    end
  end

  def show
  end

  private
  def log_params
    params.require(:log).permit :name, :adress, :money, :datetime, :status
  end

  def find_log
    @log = Log.find_by id: params[:id]
    unless @log
      flash[:danger] = t "errors.log_not_found"
      redirect_to logs_path
    end
  end

  def list_logs
    @title = t "log.title"
  end
end
