class LanguageStrengthsController < ApplicationController
  before_action :set_language_strength, only: [:show, :edit, :update, :destroy]

  # GET /language_strengths
  # GET /language_strengths.json
  def index
    @language_strengths = LanguageStrength.all
  end

  # GET /language_strengths/1
  # GET /language_strengths/1.json
  def show
  end

  # GET /language_strengths/new
  def new
    @language_strength = LanguageStrength.new
  end

  # GET /language_strengths/1/edit
  def edit
  end

  # POST /language_strengths
  # POST /language_strengths.json
  def create
    @language_strength = LanguageStrength.new(language_strength_params)

    respond_to do |format|
      if @language_strength.save
        format.html { redirect_to @language_strength, notice: 'Language strength was successfully created.' }
        format.json { render :show, status: :created, location: @language_strength }
      else
        format.html { render :new }
        format.json { render json: @language_strength.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /language_strengths/1
  # PATCH/PUT /language_strengths/1.json
  def update
    respond_to do |format|
      if @language_strength.update(language_strength_params)
        format.html { redirect_to @language_strength, notice: 'Language strength was successfully updated.' }
        format.json { render :show, status: :ok, location: @language_strength }
      else
        format.html { render :edit }
        format.json { render json: @language_strength.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /language_strengths/1
  # DELETE /language_strengths/1.json
  def destroy
    @language_strength.destroy
    respond_to do |format|
      format.html { redirect_to language_strengths_url, notice: 'Language strength was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language_strength
      @language_strength = LanguageStrength.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def language_strength_params
      params.require(:language_strength).permit(:name, :strength, :user_id)
    end
end
