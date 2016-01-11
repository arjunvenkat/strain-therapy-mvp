class ScientificEvidencesController < ApplicationController
  before_action :set_scientific_evidence, only: [:show, :edit, :update, :destroy]

  # GET /scientific_evidences
  # GET /scientific_evidences.json
  def index
    @scientific_evidences = ScientificEvidence.all
  end

  # GET /scientific_evidences/1
  # GET /scientific_evidences/1.json
  def show
  end

  # GET /scientific_evidences/new
  def new
    @scientific_evidence = ScientificEvidence.new
  end

  # GET /scientific_evidences/1/edit
  def edit
  end

  # POST /scientific_evidences
  # POST /scientific_evidences.json
  def create
    @scientific_evidence = ScientificEvidence.new(scientific_evidence_params)

    respond_to do |format|
      if @scientific_evidence.save
        format.html { redirect_to @scientific_evidence, notice: 'Scientific evidence was successfully created.' }
        format.json { render :show, status: :created, location: @scientific_evidence }
      else
        format.html { render :new }
        format.json { render json: @scientific_evidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scientific_evidences/1
  # PATCH/PUT /scientific_evidences/1.json
  def update
    respond_to do |format|
      if @scientific_evidence.update(scientific_evidence_params)
        format.html { redirect_to @scientific_evidence, notice: 'Scientific evidence was successfully updated.' }
        format.json { render :show, status: :ok, location: @scientific_evidence }
      else
        format.html { render :edit }
        format.json { render json: @scientific_evidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scientific_evidences/1
  # DELETE /scientific_evidences/1.json
  def destroy
    @scientific_evidence.destroy
    respond_to do |format|
      format.html { redirect_to scientific_evidences_url, notice: 'Scientific evidence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scientific_evidence
      @scientific_evidence = ScientificEvidence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scientific_evidence_params
      params.require(:scientific_evidence).permit(:ailment_id, :description, :link, :featured, :comment)
    end
end
