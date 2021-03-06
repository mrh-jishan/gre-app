class StudyPlansController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_study_plan, only: %i[ show edit update destroy ]

  # GET /study_plans or /study_plans.json
  def index
    @study_plans = @user.study_plans.all
  end

  # GET /study_plans/1 or /study_plans/1.json
  def show
  end

  # GET /study_plans/new
  def new
    @study_plan = @user.study_plans.new
  end

  # GET /study_plans/1/edit
  def edit
  end

  # POST /study_plans or /study_plans.json
  def create
    @study_plan = @user.study_plans.new(study_plan_params)
    if @study_plan.save
      redirect_to study_plan_url(@study_plan), notice: "Study plan was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /study_plans/1 or /study_plans/1.json
  def update
    if @study_plan.update(study_plan_params)
      redirect_to study_plan_url(@study_plan), notice: "Study plan was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /study_plans/1 or /study_plans/1.json
  def destroy
    @study_plan.destroy
    redirect_to study_plans_url, notice: "Study plan was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_study_plan
    @study_plan = @user.study_plans.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def study_plan_params
    params.require(:study_plan).permit(:plan_name)
  end
end
