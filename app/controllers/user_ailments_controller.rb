class UserAilmentsController < ApplicationController
  before_action :set_user_ailment, only: [:show, :edit, :update, :destroy]

  # GET /user_ailments
  # GET /user_ailments.json
  def index
    @user_ailments = UserAilment.all
  end

  # GET /user_ailments/1
  # GET /user_ailments/1.json
  def show
  end

  # GET /user_ailments/new
  def new
    @user_ailment = UserAilment.new
  end

  # GET /user_ailments/1/edit
  def edit
  end

  # POST /user_ailments
  # POST /user_ailments.json
  def create
    @user_ailment = UserAilment.new(user_ailment_params)

    respond_to do |format|
      if @user_ailment.save
        format.html { redirect_to @user_ailment, notice: 'User ailment was successfully created.' }
        format.json { render :show, status: :created, location: @user_ailment }
      else
        format.html { render :new }
        format.json { render json: @user_ailment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_ailments/1
  # PATCH/PUT /user_ailments/1.json
  def update
    respond_to do |format|
      if @user_ailment.update(user_ailment_params)
        format.html { redirect_to @user_ailment, notice: 'User ailment was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_ailment }
      else
        format.html { render :edit }
        format.json { render json: @user_ailment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_ailments/1
  # DELETE /user_ailments/1.json
  def destroy
    @user_ailment.destroy
    respond_to do |format|
      format.html { redirect_to user_ailments_url, notice: 'User ailment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_ailment
      @user_ailment = UserAilment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_ailment_params
      params.require(:user_ailment).permit(:user_id, :ailment_id)
    end
end
