class Api::V1::VocabularySetsController < Api::ApiController
  before_action :authorize_request

  before_action :set_study_plan
  before_action :set_vocabulary_set, only: %i[ update ]

  def index
    @vocabulary_sets = @study_plan.vocabulary_sets.left_joins(:vocabularies)
                           .select("vocabulary_sets.id,vocabulary_sets.study_plan_id,vocabulary_sets.is_completed, vocabulary_sets.set_name, count(vocabularies.id) as vocabularies_count")
                           .group("vocabulary_sets.id")
    json_response({:vocabulary_sets => @vocabulary_sets}, 200)
  end

  def update
    if @vocabulary_set.update(vocabulary_set_params)
      json_response({:vocabulary_sets => @vocabulary_sets}, 200)
    else
      json_response(@vocabulary_set.errors, :unprocessable_entity)
    end
  end

  private

  def set_study_plan
    @study_plan = @user.study_plans.find(params[:study_plan_id])
  end

  def set_vocabulary_set
    @vocabulary_set = @study_plan.vocabulary_sets.find(params[:id])
  end

  def vocabulary_set_params
    params.require(:vocabulary_set).permit(:is_completed)
  end

end
