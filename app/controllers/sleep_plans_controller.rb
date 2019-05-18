class SleepPlansController < ApplicationController
  before_action :set_sleep_plan, only: [:show, :edit, :update, :destroy]

  # GET /sleep_plans
  # GET /sleep_plans.json
  def index
    @sleep_plans = SleepPlan.all
  end

  # GET /sleep_plans/1
  # GET /sleep_plans/1.json
  def show
  end

  # GET /sleep_plans/new
  def new
    @sleep_plan = SleepPlan.new
  end

  # GET /sleep_plans/1/edit
  def edit
  end

  # POST /sleep_plans
  # POST /sleep_plans.json
  def create
    @sleep_plan = SleepPlan.new(sleep_plan_params)

    respond_to do |format|
      if @sleep_plan.save
        format.html { redirect_to @sleep_plan, notice: 'Sleep plan was successfully created.' }
        format.json { render :show, status: :created, location: @sleep_plan }
      else
        format.html { render :new }
        format.json { render json: @sleep_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sleep_plans/1
  # PATCH/PUT /sleep_plans/1.json
  def update
    respond_to do |format|
      if @sleep_plan.update(sleep_plan_params)
        format.html { redirect_to @sleep_plan, notice: 'Sleep plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @sleep_plan }
      else
        format.html { render :edit }
        format.json { render json: @sleep_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sleep_plans/1
  # DELETE /sleep_plans/1.json
  def destroy
    @sleep_plan.destroy
    respond_to do |format|
      format.html { redirect_to sleep_plans_url, notice: 'Sleep plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sleep_plan
      @sleep_plan = SleepPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sleep_plan_params
      params.require(:sleep_plan).permit(:plan)
    end
end
