class VocabulariesController < ApplicationController
  before_action :set_study_plan, :set_vocabulary_sets
  before_action :set_vocabulary, only: %i[ show edit update destroy ]

  # GET /vocabularies or /vocabularies.json
  def index
    @vocabularies = @vocabulary_set.vocabularies
  end

  # GET /vocabularies/1 or /vocabularies/1.json
  def show
  end

  # GET /vocabularies/new
  def new
    @vocabulary = @vocabulary_set.vocabularies.new
  end

  # GET /vocabularies/1/edit
  def edit
  end

  # POST /vocabularies or /vocabularies.json
  def create
    @vocabulary = @vocabulary_set.vocabularies.create(vocabulary_params)
    respond_to do |format|
      if @vocabulary.save
        format.html { redirect_to study_plan_vocabulary_set_vocabularies_url(@study_plan, @vocabulary_set), notice: "Vocabulary was successfully created." }
        format.json { render :show, status: :created, location: @vocabulary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vocabulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vocabularies/1 or /vocabularies/1.json
  def update
    respond_to do |format|
      if @vocabulary.update(vocabulary_params)
        format.html { redirect_to study_plan_vocabulary_set_vocabularies_url(@study_plan, @vocabulary_set, @vocabulary), notice: "Vocabulary was successfully updated." }
        format.json { render :show, status: :ok, location: @vocabulary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vocabulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vocabularies/1 or /vocabularies/1.json
  def destroy
    @vocabulary.destroy

    respond_to do |format|
      format.html { redirect_to study_plan_vocabulary_set_vocabularies_url, notice: "Vocabulary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_study_plan
    @study_plan = @user.study_plans.find(params[:study_plan_id])
  end

  def set_vocabulary_sets
    @vocabulary_set = @study_plan.vocabulary_sets.find(params[:vocabulary_set_id])
  end

  def set_vocabulary
    @vocabulary = Vocabulary.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def vocabulary_params
    params.require(:vocabulary).permit(:base_word, :translation, :synonym, :description)
  end
end
