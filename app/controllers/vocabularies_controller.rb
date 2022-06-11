class VocabulariesController < ApplicationController
  before_action :require_user_logged_in!

  before_action :set_vocabulary, only: %i[ show edit update destroy ]

  # GET /vocabularies or /vocabularies.json
  def index
    @vocabularies = Vocabulary.all
  end

  # GET /vocabularies/1 or /vocabularies/1.json
  def show
  end

  # GET /vocabularies/new
  def new
    @vocabulary = Vocabulary.new
  end

  # GET /vocabularies/1/edit
  def edit
  end

  # POST /vocabularies or /vocabularies.json
  def create
    @vocabulary = Vocabulary.new(vocabulary_params)
    if @vocabulary.save
      redirect_to vocabularies_url, notice: "Vocabulary was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vocabularies/1 or /vocabularies/1.json
  def update
    if @vocabulary.update(vocabulary_params)
      redirect_to vocabularies_url, notice: "Vocabulary was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /vocabularies/1 or /vocabularies/1.json
  def destroy
    @vocabulary.destroy
    redirect_to vocabularies_url, notice: "Vocabulary was successfully destroyed."
  end

  private

  def set_vocabulary
    @vocabulary = Vocabulary.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def vocabulary_params
    params.require(:vocabulary).permit(:base_word, :translation, :synonym, :description)
  end
end
