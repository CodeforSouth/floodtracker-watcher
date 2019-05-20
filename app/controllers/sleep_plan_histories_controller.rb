class SleepPlanHistoriesController < ApplicationController
  before_action :set_sleep_plan_history, only: [:show, :edit, :update, :destroy]

  # GET /sleep_plan_histories
  # GET /sleep_plan_histories.json
  def index
    @sleep_plan_histories = SleepPlanHistory.all
  end

  # GET /sleep_plan_histories/1
  # GET /sleep_plan_histories/1.json
  def show
  end

  # GET /sleep_plan_histories/new
  def new
    @sleep_plan_history = SleepPlanHistory.new
  end

  # GET /sleep_plan_histories/1/edit
  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sleep_plan_history
      @sleep_plan_history = SleepPlanHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sleep_plan_history_params
      params.require(:sleep_plan_history).permit(:date, :coreid, :sleep_count, :first_publish, :last_id, :min_plan, :mean_reading, :total_plan, :max_plan)
    end
end
