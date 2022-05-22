class Api::V1::StudyPlansController < ApiController
  before_action :set_study_plan, only: %i[ show edit update destroy ]

  # GET /study_plans or /study_plans.json
  def index
    @study_plans = @user.study_plans.all
  end

  # POST /study_plans or /study_plans.json
  def create
    @study_plan = @user.study_plans.new(study_plan_params)

    respond_to do |format|
      if @study_plan.save
        format.html { redirect_to study_plan_url(@study_plan), notice: "Study plan was successfully created." }
        format.json { render :show, status: :created, location: @study_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @study_plan.errors, status: :unprocessable_entity }
      end
    end
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
