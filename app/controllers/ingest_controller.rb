class IngestController < ApplicationController
  skip_forgery_protection only: %i{create}

  def create
    if params[:key] != ENV['KEY']
      return render text: 'idk', status: 403
    end

    @event = Ingester.ingest params.permit(:event, :data,
                                           :coreid, :published_at)

    respond_to do |format|
      if @event.persisted?
        format.html { redirect_to @event }
        format.json { render json: @event.to_json }
      else
        format.html { render text: 'failed', status: 403 }
        format.json { render json: @event.rrors, status: :unprocessable_entity }
      end
    end
  end
end
