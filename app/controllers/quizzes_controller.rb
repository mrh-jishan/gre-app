class QuizzesController < ApplicationController
  before_action :require_user_logged_in!

  before_action :set_study_plan

  def index
    @quizzes = @study_plan.vocabulary_sets
                   .left_joins(:vocabularies)
                   .where("vocabulary_sets.is_completed = ?", true)
                   .select("vocabularies.id as id,vocabularies.base_word as base_word,vocabularies.translation as translation,vocabularies.synonym as synonym,vocabularies.description as description,vocabulary_sets.set_name as set_name,vocabulary_sets.is_completed as is_completed")
                   .group("vocabularies.id")
  end

  private

  def set_study_plan
    @study_plan = @user.study_plans.find(params[:study_plan_id])
  end
end
