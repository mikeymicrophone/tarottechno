class PlacesController < ApplicationController
  before_action :set_place, only: [:notify_querent, :show, :edit, :update, :destroy]

  def notify_querent
    @place.notify_querent
    if @place.querent.phone?
      render :text => "texted them"
    else
      render :text => "no phone listed"
    end
  end

  # GET /places
  # GET /places.json
  def index
    @places = Place.all
  end

  # GET /places/1
  # GET /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)
    @place.querent ||= current_querent

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    update_success = @place.update(place_params)
    if update_success
      @place.line.notify_next_querent
    end
    respond_to do |format|
      if update_success
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:line_id, :querent_id, :ordering, :complete)
    end
end
