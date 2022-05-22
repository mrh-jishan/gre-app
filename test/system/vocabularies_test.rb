require "application_system_test_case"

class VocabulariesTest < ApplicationSystemTestCase
  setup do
    @vocabulary = vocabularies(:one)
  end

  test "visiting the index" do
    visit vocabularies_url
    assert_selector "h1", text: "Vocabularies"
  end

  test "creating a Vocabulary" do
    visit vocabularies_url
    click_on "New Vocabulary"

    fill_in "Base word", with: @vocabulary.base_word
    fill_in "Description", with: @vocabulary.description
    fill_in "Synonym", with: @vocabulary.synonym
    fill_in "Translation", with: @vocabulary.translation
    fill_in "Vocabulary sets", with: @vocabulary.vocabulary_sets_id
    click_on "Create Vocabulary"

    assert_text "Vocabulary was successfully created"
    click_on "Back"
  end

  test "updating a Vocabulary" do
    visit vocabularies_url
    click_on "Edit", match: :first

    fill_in "Base word", with: @vocabulary.base_word
    fill_in "Description", with: @vocabulary.description
    fill_in "Synonym", with: @vocabulary.synonym
    fill_in "Translation", with: @vocabulary.translation
    fill_in "Vocabulary sets", with: @vocabulary.vocabulary_sets_id
    click_on "Update Vocabulary"

    assert_text "Vocabulary was successfully updated"
    click_on "Back"
  end

  test "destroying a Vocabulary" do
    visit vocabularies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vocabulary was successfully destroyed"
  end
end
