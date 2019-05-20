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

  # POST /battery_histories
  # POST /battery_histories.json
  def create
    @battery_history = BatteryHistory.new(battery_history_params)

    respond_to do |format|
      if @battery_history.save
        format.html { redirect_to @battery_history, notice: 'Battery history was successfully created.' }
        format.json { render :show, status: :created, location: @battery_history }
      else
        format.html { render :new }
        format.json { render json: @battery_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /battery_histories/1
  # PATCH/PUT /battery_histories/1.json
  def update
    respond_to do |format|
      if @battery_history.update(battery_history_params)
        format.html { redirect_to @battery_history, notice: 'Battery history was successfully updated.' }
        format.json { render :show, status: :ok, location: @battery_history }
      else
        format.html { render :edit }
        format.json { render json: @battery_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battery_histories/1
  # DELETE /battery_histories/1.json
  def destroy
    @battery_history.destroy
    respond_to do |format|
      format.html { redirect_to battery_histories_url, notice: 'Battery history was successfully destroyed.' }
      format.json { head :no_content }
    end
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
