class ArmazemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy]
  before_action :set_armazem, only: %i[ show edit update destroy ]

  # GET /armazems or /armazems.json
  def index
    @armazems = Armazem.all
  end

  # GET /armazems/1 or /armazems/1.json
  def show
    @armazem = Armazem.find(params[:id])
  end

  # GET /armazems/new
  def new
    @armazem = Armazem.new
  end

  # GET /armazems/1/edit
  def edit
  end

  # POST /armazems or /armazems.json
  def create
    @armazem = Armazem.new(armazem_params)

    respond_to do |format|
      if @armazem.save
        format.html { redirect_to @armazem, notice: "Armazem was successfully created." }
        format.json { render :show, status: :created, location: @armazem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @armazem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /armazems/1 or /armazems/1.json
  def update
    respond_to do |format|
      if @armazem.update(armazem_params)
        format.html { redirect_to @armazem, notice: "Armazem was successfully updated." }
        format.json { render :show, status: :ok, location: @armazem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @armazem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /armazems/1 or /armazems/1.json
  def destroy
    @armazem.destroy
    respond_to do |format|
      format.html { redirect_to armazems_url, notice: "Armazem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_armazem
      @armazem = Armazem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def armazem_params
      params.require(:armazem).permit(:name, :brand, :weight, :price, :description, :expiration, :avatar)
    end
end
