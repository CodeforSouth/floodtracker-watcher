class LevelHistoriesController < ApplicationController
  before_action :set_level_history, only: [:show, :edit, :update, :destroy]

  # GET /level_histories
  # GET /level_histories.json
  def index
    @level_histories = LevelHistory.all
  end

  # GET /level_histories/1
  # GET /level_histories/1.json
  def show
  end

  # GET /level_histories/new
  def new
    @level_history = LevelHistory.new
  end

  # GET /level_histories/1/edit
  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level_history
      @level_history = LevelHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level_history_params
      params.require(:level_history).permit(:date, :coreid, :count, :first_publish, :last_id, :min_reading, :mean_reading, :stddev_reading, :max_reading, :first_reading)
    end
end
