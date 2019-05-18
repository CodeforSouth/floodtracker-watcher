class SparkDiagnosticsController < ApplicationController
  before_action :set_spark_diagnostic, only: [:show, :edit, :update, :destroy]

  # GET /spark_diagnostics
  # GET /spark_diagnostics.json
  def index
    @spark_diagnostics = SparkDiagnostic.all
  end

  # GET /spark_diagnostics/1
  # GET /spark_diagnostics/1.json
  def show
  end

  # GET /spark_diagnostics/new
  def new
    @spark_diagnostic = SparkDiagnostic.new
  end

  # GET /spark_diagnostics/1/edit
  def edit
  end

  # # POST /spark_diagnostics
  # # POST /spark_diagnostics.json
  # def create
  #   @spark_diagnostic = SparkDiagnostic.new(spark_diagnostic_params)

  #   respond_to do |format|
  #     if @spark_diagnostic.save
  #       format.html { redirect_to @spark_diagnostic, notice: 'Spark diagnostic was successfully created.' }
  #       format.json { render :show, status: :created, location: @spark_diagnostic }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @spark_diagnostic.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /spark_diagnostics/1
  # # PATCH/PUT /spark_diagnostics/1.json
  # def update
  #   respond_to do |format|
  #     if @spark_diagnostic.update(spark_diagnostic_params)
  #       format.html { redirect_to @spark_diagnostic, notice: 'Spark diagnostic was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @spark_diagnostic }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @spark_diagnostic.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /spark_diagnostics/1
  # # DELETE /spark_diagnostics/1.json
  # def destroy
  #   @spark_diagnostic.destroy
  #   respond_to do |format|
  #     format.html { redirect_to spark_diagnostics_url, notice: 'Spark diagnostic was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spark_diagnostic
      @spark_diagnostic = SparkDiagnostic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spark_diagnostic_params
      params.require(:spark_diagnostic).permit(:diagnostic)
    end
end
