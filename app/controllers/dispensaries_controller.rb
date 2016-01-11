class DispensariesController < ApplicationController
  before_action :set_dispensary, only: [:show, :edit, :update, :destroy]

  # GET /dispensaries
  # GET /dispensaries.json
  def index
    @dispensaries = Dispensary.all
  end

  # GET /dispensaries/1
  # GET /dispensaries/1.json
  def show
  end

  # GET /dispensaries/new
  def new
    @dispensary = Dispensary.new
  end

  # GET /dispensaries/1/edit
  def edit
  end

  # POST /dispensaries
  # POST /dispensaries.json
  def create
    @dispensary = Dispensary.new(dispensary_params)

    respond_to do |format|
      if @dispensary.save
        format.html { redirect_to @dispensary, notice: 'Dispensary was successfully created.' }
        format.json { render :show, status: :created, location: @dispensary }
      else
        format.html { render :new }
        format.json { render json: @dispensary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dispensaries/1
  # PATCH/PUT /dispensaries/1.json
  def update
    respond_to do |format|
      if @dispensary.update(dispensary_params)
        format.html { redirect_to @dispensary, notice: 'Dispensary was successfully updated.' }
        format.json { render :show, status: :ok, location: @dispensary }
      else
        format.html { render :edit }
        format.json { render json: @dispensary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispensaries/1
  # DELETE /dispensaries/1.json
  def destroy
    @dispensary.destroy
    respond_to do |format|
      format.html { redirect_to dispensaries_url, notice: 'Dispensary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispensary
      @dispensary = Dispensary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dispensary_params
      params.require(:dispensary).permit(:name, :description)
    end
end
