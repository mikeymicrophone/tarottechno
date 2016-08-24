class InterpretationsController < ApplicationController
  before_action :set_interpretation, only: [:show, :rewrite, :edit, :update, :destroy]

  # GET /interpretations
  # GET /interpretations.json
  def index
    @interpretations = Interpretation.not_private_reading.order('created_at desc')
  end

  # GET /interpretations/1
  # GET /interpretations/1.json
  def show
  end

  # GET /interpretations/new
  def new
    @interpretation = Interpretation.new
  end
  
  def rewrite
  end

  # GET /interpretations/1/edit
  def edit
  end

  # POST /interpretations
  # POST /interpretations.json
  def create
    @interpretation = Interpretation.new(interpretation_params)

    respond_to do |format|
      if @interpretation.save
        format.html { redirect_to @interpretation, notice: 'Interpretation was created.' }
        format.js
        format.json { render :show, status: :created, location: @interpretation }
      else
        format.html { render :new }
        format.json { render json: @interpretation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interpretations/1
  # PATCH/PUT /interpretations/1.json
  def update
    respond_to do |format|
      if @interpretation.update(interpretation_params)
        format.html { redirect_to @interpretation, notice: 'Interpretation was updated.' }
        format.json { render :show, status: :ok, location: @interpretation }
      else
        format.html { render :edit }
        format.json { render json: @interpretation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interpretations/1
  # DELETE /interpretations/1.json
  def destroy
    @interpretation.destroy
    respond_to do |format|
      format.html { redirect_to interpretations_url, notice: 'Interpretation was destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interpretation
      @interpretation = Interpretation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interpretation_params
      params.require(:interpretation).permit(:card_id, :appearance_id, :phrase, :description, :reader_id)
    end
end
