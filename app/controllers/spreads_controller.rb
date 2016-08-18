class SpreadsController < ApplicationController
  before_action :set_spread, only: [:show, :edit, :update, :destroy]

  # GET /spreads
  # GET /spreads.json
  def index
    @spreads = Spread.all
  end

  # GET /spreads/1
  # GET /spreads/1.json
  def show
  end

  # GET /spreads/new
  def new
    @spread = Spread.new
  end

  # GET /spreads/1/edit
  def edit
  end

  # POST /spreads
  # POST /spreads.json
  def create
    @spread = Spread.new(spread_params)

    respond_to do |format|
      if @spread.save
        format.html { redirect_to @spread, notice: 'The spread was created.' }
        format.json { render :show, status: :created, location: @spread }
      else
        format.html { render :new }
        format.json { render json: @spread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spreads/1
  # PATCH/PUT /spreads/1.json
  def update
    respond_to do |format|
      if @spread.update(spread_params)
        format.html { redirect_to @spread, notice: 'This spread is updated.' }
        format.json { render :show, status: :ok, location: @spread }
      else
        format.html { render :edit }
        format.json { render json: @spread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spreads/1
  # DELETE /spreads/1.json
  def destroy
    @spread.destroy
    respond_to do |format|
      format.html { redirect_to spreads_url, notice: 'Spread was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spread
      @spread = Spread.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spread_params
      params.require(:spread).permit(:tradition_id, :description, :name)
    end
end
