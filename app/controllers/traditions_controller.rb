class TraditionsController < ApplicationController
  before_action :set_tradition, only: [:show, :edit, :update, :destroy]

  # GET /traditions
  # GET /traditions.json
  def index
    @traditions = Tradition.all
  end

  # GET /traditions/1
  # GET /traditions/1.json
  def show
  end

  # GET /traditions/new
  def new
    @tradition = Tradition.new
  end

  # GET /traditions/1/edit
  def edit
  end

  # POST /traditions
  # POST /traditions.json
  def create
    @tradition = Tradition.new(tradition_params)

    respond_to do |format|
      if @tradition.save
        format.html { redirect_to @tradition, notice: 'Tradition was successfully created.' }
        format.json { render :show, status: :created, location: @tradition }
      else
        format.html { render :new }
        format.json { render json: @tradition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /traditions/1
  # PATCH/PUT /traditions/1.json
  def update
    respond_to do |format|
      if @tradition.update(tradition_params)
        format.html { redirect_to @tradition, notice: 'Tradition was successfully updated.' }
        format.json { render :show, status: :ok, location: @tradition }
      else
        format.html { render :edit }
        format.json { render json: @tradition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /traditions/1
  # DELETE /traditions/1.json
  def destroy
    @tradition.destroy
    respond_to do |format|
      format.html { redirect_to traditions_url, notice: 'Tradition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tradition
      @tradition = Tradition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tradition_params
      params.require(:tradition).permit(:name)
    end
end
