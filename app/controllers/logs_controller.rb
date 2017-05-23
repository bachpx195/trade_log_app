class LogsController < ApplicationController
  before_action :find_log, except: [:index, :new, :create]
  before_action :list_logs, only: [:index, :destroy]

  def index
  end

  def new
    @log =Log.new
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
    @log.destroy
    respond_to do |format|
      format.html {redirect_to logs_path, notice: t("log.destroy")}
      format.js {render layout: false}
    end
  end

  def show
  end

  private
  def log_params
    # params.require(:log).permit :name. :adress, :money, :status
  end

  def find_log
    @log = Log.find_by id: params[:id]
    unless @log
      flash[:danger] = t "errors.log_not_found"
      redirect_to logs_path
    end
  end

  def list_logs
    @logs = Log.all
    @logs_count = @logs.size
    @title = t "log.title"
  end
end
