class LevelRawsController < ApplicationController
  before_action :set_level_raw, only: [:show, :edit, :update, :destroy]

  # GET /level_raws
  # GET /level_raws.json
  def index
    @level_raws = LevelRaw.all
  end

  # GET /level_raws/1
  # GET /level_raws/1.json
  def show
  end

  # GET /level_raws/new
  def new
    @level_raw = LevelRaw.new
  end

  # GET /level_raws/1/edit
  def edit
  end

  # POST /level_raws
  # POST /level_raws.json
  def create
    @level_raw = LevelRaw.new(level_raw_params)

    respond_to do |format|
      if @level_raw.save
        format.html { redirect_to @level_raw, notice: 'Level raw was successfully created.' }
        format.json { render :show, status: :created, location: @level_raw }
      else
        format.html { render :new }
        format.json { render json: @level_raw.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /level_raws/1
  # PATCH/PUT /level_raws/1.json
  def update
    respond_to do |format|
      if @level_raw.update(level_raw_params)
        format.html { redirect_to @level_raw, notice: 'Level raw was successfully updated.' }
        format.json { render :show, status: :ok, location: @level_raw }
      else
        format.html { render :edit }
        format.json { render json: @level_raw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /level_raws/1
  # DELETE /level_raws/1.json
  def destroy
    @level_raw.destroy
    respond_to do |format|
      format.html { redirect_to level_raws_url, notice: 'Level raw was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level_raw
      @level_raw = LevelRaw.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level_raw_params
      params.require(:level_raw).permit(:readings)
    end
end
