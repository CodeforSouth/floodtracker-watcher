class QuipsController < ApplicationController
  before_action :set_quip, only: [:show, :edit, :update, :destroy]

  # GET /quips
  # GET /quips.json
  def index
    @quips = Quip.all
  end

  # GET /quips/1
  # GET /quips/1.json
  def show
  end

  # GET /quips/new
  def new
    @quip = Quip.new
  end

  # GET /quips/1/edit
  def edit
  end

  # POST /quips
  # POST /quips.json
  def create
    @quip = Quip.new(quip_params)

    respond_to do |format|
      if @quip.save
        format.html { redirect_to @quip, notice: 'Quip was successfully created.' }
        format.json { render :show, status: :created, location: @quip }
      else
        format.html { render :new }
        format.json { render json: @quip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quips/1
  # PATCH/PUT /quips/1.json
  def update
    respond_to do |format|
      if @quip.update(quip_params)
        format.html { redirect_to @quip, notice: 'Quip was successfully updated.' }
        format.json { render :show, status: :ok, location: @quip }
      else
        format.html { render :edit }
        format.json { render json: @quip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quips/1
  # DELETE /quips/1.json
  def destroy
    @quip.destroy
    respond_to do |format|
      format.html { redirect_to quips_url, notice: 'Quip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quip
      @quip = Quip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quip_params
      params.require(:quip).permit(:body)
    end
end
