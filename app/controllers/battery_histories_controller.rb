class BatteryHistoriesController < ApplicationController
  before_action :set_battery_history, only: [:show, :edit, :update, :destroy]

  # GET /battery_histories
  # GET /battery_histories.json
  def index
    @battery_histories = BatteryHistory.all
  end

  # GET /battery_histories/1
  # GET /battery_histories/1.json
  def show
  end

  # GET /battery_histories/new
  def new
    @battery_history = BatteryHistory.new
  end

  # GET /battery_histories/1/edit
  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_battery_history
      @battery_history = BatteryHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def battery_history_params
      params.require(:battery_history).permit(:date, :coreid, :count, :first_publish, :last_id, :min_reading, :mean_reading, :stddev_reading, :max_reading, :first_reading)
    end
end
