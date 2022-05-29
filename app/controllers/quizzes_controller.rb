class QuizzesController < ApplicationController
  before_action :require_user_logged_in!

  before_action :set_study_plan

  def index
    @quizzes = @study_plan.vocabularies.includes(:vocabulary_sets)
                   .where("vocabulary_sets.is_completed = ?", true)
                   .group(:id).order("RANDOM()")
  end

  private

  def set_study_plan
    @study_plan = @user.study_plans.find(params[:study_plan_id])
  end
end
