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

  # POST /level_histories
  # POST /level_histories.json
  def create
    @level_history = LevelHistory.new(level_history_params)

    respond_to do |format|
      if @level_history.save
        format.html { redirect_to @level_history, notice: 'Level history was successfully created.' }
        format.json { render :show, status: :created, location: @level_history }
      else
        format.html { render :new }
        format.json { render json: @level_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /level_histories/1
  # PATCH/PUT /level_histories/1.json
  def update
    respond_to do |format|
      if @level_history.update(level_history_params)
        format.html { redirect_to @level_history, notice: 'Level history was successfully updated.' }
        format.json { render :show, status: :ok, location: @level_history }
      else
        format.html { render :edit }
        format.json { render json: @level_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /level_histories/1
  # DELETE /level_histories/1.json
  def destroy
    @level_history.destroy
    respond_to do |format|
      format.html { redirect_to level_histories_url, notice: 'Level history was successfully destroyed.' }
      format.json { head :no_content }
    end
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
