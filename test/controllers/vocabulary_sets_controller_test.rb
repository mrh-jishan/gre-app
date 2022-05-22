require "test_helper"

class VocabularySetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vocabulary_set = vocabulary_sets(:one)
  end

  test "should get index" do
    get vocabulary_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_vocabulary_set_url
    assert_response :success
  end

  test "should create vocabulary_set" do
    assert_difference('VocabularySet.count') do
      post vocabulary_sets_url, params: { vocabulary_set: { set_name: @vocabulary_set.set_name, study_plan_id: @vocabulary_set.study_plan_id } }
    end

    assert_redirected_to vocabulary_set_url(VocabularySet.last)
  end

  test "should show vocabulary_set" do
    get vocabulary_set_url(@vocabulary_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_vocabulary_set_url(@vocabulary_set)
    assert_response :success
  end

  test "should update vocabulary_set" do
    patch vocabulary_set_url(@vocabulary_set), params: { vocabulary_set: { set_name: @vocabulary_set.set_name, study_plan_id: @vocabulary_set.study_plan_id } }
    assert_redirected_to vocabulary_set_url(@vocabulary_set)
  end

  test "should destroy vocabulary_set" do
    assert_difference('VocabularySet.count', -1) do
      delete vocabulary_set_url(@vocabulary_set)
    end

    assert_redirected_to vocabulary_sets_url
  end
end
