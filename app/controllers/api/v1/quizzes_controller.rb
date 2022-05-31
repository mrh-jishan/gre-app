class Api::V1::QuizzesController < Api::ApiController
  before_action :authorize_request

  before_action :set_study_plan

  def index
    @quizzes = @study_plan.vocabularies.includes(:vocabulary_sets)
                   .where("vocabulary_sets.is_completed = ?", true)
                   .group(:id).order("RANDOM()")
    json_response(@quizzes, 200)
  end

  private

  def set_study_plan
    @study_plan = @user.study_plans.find(params[:study_plan_id])
  end
end
