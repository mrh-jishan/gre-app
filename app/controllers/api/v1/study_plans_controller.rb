class Api::V1::StudyPlansController < Api::ApiController
  before_action :authorize_request

  def index
    @study_plans = @user.study_plans.all
    json_response({:study_plans => @study_plans}, 200)
  end
end
