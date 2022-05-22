require "test_helper"

class StudyPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @study_plan = study_plans(:one)
  end

  test "should get index" do
    get study_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_study_plan_url
    assert_response :success
  end

  test "should create study_plan" do
    assert_difference('StudyPlan.count') do
      post study_plans_url, params: { study_plan: { plan_name: @study_plan.plan_name, user_id: @study_plan.user_id } }
    end

    assert_redirected_to study_plan_url(StudyPlan.last)
  end

  test "should show study_plan" do
    get study_plan_url(@study_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_study_plan_url(@study_plan)
    assert_response :success
  end

  test "should update study_plan" do
    patch study_plan_url(@study_plan), params: { study_plan: { plan_name: @study_plan.plan_name, user_id: @study_plan.user_id } }
    assert_redirected_to study_plan_url(@study_plan)
  end

  test "should destroy study_plan" do
    assert_difference('StudyPlan.count', -1) do
      delete study_plan_url(@study_plan)
    end

    assert_redirected_to study_plans_url
  end
end
