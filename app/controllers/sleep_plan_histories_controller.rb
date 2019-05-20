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

  # POST /sleep_plan_histories
  # POST /sleep_plan_histories.json
  def create
    @sleep_plan_history = SleepPlanHistory.new(sleep_plan_history_params)

    respond_to do |format|
      if @sleep_plan_history.save
        format.html { redirect_to @sleep_plan_history, notice: 'Sleep plan history was successfully created.' }
        format.json { render :show, status: :created, location: @sleep_plan_history }
      else
        format.html { render :new }
        format.json { render json: @sleep_plan_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sleep_plan_histories/1
  # PATCH/PUT /sleep_plan_histories/1.json
  def update
    respond_to do |format|
      if @sleep_plan_history.update(sleep_plan_history_params)
        format.html { redirect_to @sleep_plan_history, notice: 'Sleep plan history was successfully updated.' }
        format.json { render :show, status: :ok, location: @sleep_plan_history }
      else
        format.html { render :edit }
        format.json { render json: @sleep_plan_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sleep_plan_histories/1
  # DELETE /sleep_plan_histories/1.json
  def destroy
    @sleep_plan_history.destroy
    respond_to do |format|
      format.html { redirect_to sleep_plan_histories_url, notice: 'Sleep plan history was successfully destroyed.' }
      format.json { head :no_content }
    end
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
