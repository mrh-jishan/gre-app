require "application_system_test_case"

class StudyPlansTest < ApplicationSystemTestCase
  setup do
    @study_plan = study_plans(:one)
  end

  test "visiting the index" do
    visit study_plans_url
    assert_selector "h1", text: "Study Plans"
  end

  test "creating a Study plan" do
    visit study_plans_url
    click_on "New Study Plan"

    fill_in "Plan name", with: @study_plan.plan_name
    fill_in "User", with: @study_plan.user_id
    click_on "Create Study plan"

    assert_text "Study plan was successfully created"
    click_on "Back"
  end

  test "updating a Study plan" do
    visit study_plans_url
    click_on "Edit", match: :first

    fill_in "Plan name", with: @study_plan.plan_name
    fill_in "User", with: @study_plan.user_id
    click_on "Update Study plan"

    assert_text "Study plan was successfully updated"
    click_on "Back"
  end

  test "destroying a Study plan" do
    visit study_plans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Study plan was successfully destroyed"
  end
end
