class SparksController < ApplicationController
  before_action :set_spark, only: [:show, :edit, :update, :destroy]
  skip_forgery_protection only: %i{create}

  # GET /sparks
  # GET /sparks.json
  def index
    @sparks = Spark.order(id: :desc).all
  end

  # GET /sparks/1
  # GET /sparks/1.json
  def show
  end

  # GET /sparks/new
  def new
    @spark = Spark.new
  end

  # GET /sparks/1/edit
  def edit
  end

  # POST /sparks
  # POST /sparks.json
  def create
    if params[:key] != ENV['KEY']
      return render text: 'idk', status: 403
    end
    @spark = Spark.new(params.permit(:event, :data, :coreid, :published_at))

    respond_to do |format|
      if @spark.save
        format.html { redirect_to @spark, notice: 'Spark was successfully created.' }
        format.json { render :show, status: :created, location: @spark }
      else
        format.html { render :new }
        format.json { render json: @spark.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spark
      @spark = Spark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spark_params
      params.require(:spark).permit(:event, :data, :coreid, :published_at)
    end
end
