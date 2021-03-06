class ReadingsController < ApplicationController
  before_action :set_reading, only: [:show, :edit, :update, :destroy, :complete, :make_private, :not_private]

  # GET /readings
  # GET /readings.json
  def index
    if params[:querent_id]
      @readings = Querent.find(params[:querent_id]).readings
    else
      @readings = Reading.not_private
    end
  end

  # GET /readings/1
  # GET /readings/1.json
  def show
    if @reading.private
      redirect_to(root_url) && return unless @reading.querent == current_querent
    end
  end

  # GET /readings/new
  def new
    @reading = Reading.new reading_params
    @reading.reader ||= current_reader
  end

  # GET /readings/1/edit
  def edit
  end

  # POST /readings
  # POST /readings.json
  def create
    @reading = Reading.new(reading_params)

    respond_to do |format|
      if @reading.save
        format.html { redirect_to @reading, notice: 'Begin the reading!' }
        format.json { render :show, status: :created, location: @reading }
      else
        format.html { render :new }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /readings/1
  # PATCH/PUT /readings/1.json
  def update
    respond_to do |format|
      if @reading.update(reading_params)
        format.html { redirect_to @reading, notice: 'This reading is updated.' }
        format.json { render :show, status: :ok, location: @reading }
      else
        format.html { render :edit }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def complete
    @reading.line.places.unfinished.where(:querent_id => @reading.querent_id).first.update_attribute(:complete, true)
    redirect_to @reading.line
  end
  
  def make_private
    @reading.update_attribute :private, true
    render :nothing => true
  end
  
  def not_private
    @reading.update_attribute :private, false
    render :nothing => true
  end

  # DELETE /readings/1
  # DELETE /readings/1.json
  def destroy
    @reading.destroy
    respond_to do |format|
      format.html { redirect_to readings_url, notice: 'Reading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading
      @reading = Reading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reading_params
      params.require(:reading).permit(:event_id, :reader_id, :querent_id, :deck_id, :spread_id)
    end
end
