class VocabularySetsController < ApplicationController
  before_action :set_study_plan
  before_action :set_vocabulary_set, only: %i[ show edit update destroy ]

  # GET /vocabulary_sets or /vocabulary_sets.json
  def index
    @vocabulary_sets = @study_plan.vocabulary_sets.all
  end

  # GET /vocabulary_sets/1 or /vocabulary_sets/1.json
  def show
  end

  # GET /vocabulary_sets/new
  def new
    @vocabulary_set = @study_plan.vocabulary_sets.new
  end

  # GET /vocabulary_sets/1/edit
  def edit
  end

  # POST /vocabulary_sets or /vocabulary_sets.json
  def create
    @vocabulary_set = @study_plan.vocabulary_sets.new(vocabulary_set_params)

    respond_to do |format|
      if @vocabulary_set.save
        format.html { redirect_to study_plan_vocabulary_sets_url(@study_plan), notice: "Vocabulary set was successfully created." }
        format.json { render :show, status: :created, location: @vocabulary_set }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vocabulary_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vocabulary_sets/1 or /vocabulary_sets/1.json
  def update
    respond_to do |format|
      if @vocabulary_set.update(vocabulary_set_params)
        format.html { redirect_to study_plan_vocabulary_set_url(@study_plan, @vocabulary_set), notice: "Vocabulary set was successfully updated." }
        format.json { render :show, status: :ok, location: @vocabulary_set }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vocabulary_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vocabulary_sets/1 or /vocabulary_sets/1.json
  def destroy
    @vocabulary_set.destroy

    respond_to do |format|
      format.html { redirect_to study_plan_vocabulary_sets_url(@study_plan), notice: "Vocabulary set was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_study_plan
    @study_plan = @user.study_plans.find(params[:study_plan_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_vocabulary_set
    @vocabulary_set = @study_plan.vocabulary_sets.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def vocabulary_set_params
    params.require(:vocabulary_set).permit(:set_name)
  end
end
