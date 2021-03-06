class VocabularySetsController < ApplicationController
  before_action :require_user_logged_in!

  before_action :set_vocabularies, only: %i[new edit]
  before_action :set_study_plan
  before_action :set_vocabulary_set, only: %i[ show edit update destroy ]

  # GET /vocabulary_sets or /vocabulary_sets.json
  def index
    @vocabulary_sets = @study_plan.vocabulary_sets.left_joins(:vocabularies)
                                  .select("vocabulary_sets.id,vocabulary_sets.study_plan_id,vocabulary_sets.is_completed, vocabulary_sets.set_name, count(vocabularies.id) as vocabularies_count")
                                  .group("vocabulary_sets.id")
  end

  # GET /vocabulary_sets/1 or /vocabulary_sets/1.json
  def show
  end

  # GET /vocabulary_sets/new
  def new
    @vocabulary_set = @study_plan.vocabulary_sets.build
  end

  # GET /vocabulary_sets/1/edit
  def edit
  end

  # POST /vocabulary_sets or /vocabulary_sets.json
  def create
    @vocabulary_set = @study_plan.vocabulary_sets.build(vocabulary_set_params)
    if @vocabulary_set.save
      redirect_to study_plan_vocabulary_sets_url(@study_plan), notice: "Vocabulary set was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vocabulary_sets/1 or /vocabulary_sets/1.json
  def update

    if @vocabulary_set.update(vocabulary_set_params)
      redirect_to study_plan_vocabulary_set_url(@study_plan, @vocabulary_set), notice: "Vocabulary set was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /vocabulary_sets/1 or /vocabulary_sets/1.json
  def destroy
    @vocabulary_set.destroy
    redirect_to study_plan_vocabulary_sets_url(@study_plan), notice: "Vocabulary set was successfully destroyed."
  end

  private

  def set_vocabularies
    @vocabularies = Vocabulary.all
  end

  def set_study_plan
    @study_plan = @user.study_plans.find(params[:study_plan_id])
  end

  def set_vocabulary_set
    @vocabulary_set = @study_plan.vocabulary_sets.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def vocabulary_set_params
    params.require(:vocabulary_set).permit(:set_name, :is_completed, { vocabulary_ids: [] })
  end
end
