require "application_system_test_case"

class VocabularySetsTest < ApplicationSystemTestCase
  setup do
    @vocabulary_set = vocabulary_sets(:one)
  end

  test "visiting the index" do
    visit vocabulary_sets_url
    assert_selector "h1", text: "Vocabulary Sets"
  end

  test "creating a Vocabulary set" do
    visit vocabulary_sets_url
    click_on "New Vocabulary Set"

    fill_in "Set name", with: @vocabulary_set.set_name
    fill_in "Study plan", with: @vocabulary_set.study_plan_id
    click_on "Create Vocabulary set"

    assert_text "Vocabulary set was successfully created"
    click_on "Back"
  end

  test "updating a Vocabulary set" do
    visit vocabulary_sets_url
    click_on "Edit", match: :first

    fill_in "Set name", with: @vocabulary_set.set_name
    fill_in "Study plan", with: @vocabulary_set.study_plan_id
    click_on "Update Vocabulary set"

    assert_text "Vocabulary set was successfully updated"
    click_on "Back"
  end

  test "destroying a Vocabulary set" do
    visit vocabulary_sets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vocabulary set was successfully destroyed"
  end
end
