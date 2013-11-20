class FlashcardsController < ApplicationController
  before_action :set_flashcard, only: [:show, :edit, :update, :destroy]

  # GET /flashcards
  # GET /flashcards.json
  def index
    @flashcards = Flashcard.all
    @flashcard_counter = rand(@flashcards.size)
  end

  # GET /flashcards/1
  # GET /flashcards/1.json
  def show
  end

  # GET /flashcards/new
  def new
    @flashcard = Flashcard.new
  end

  # GET /flashcards/1/edit
  def edit
  end

  # POST /flashcards
  # POST /flashcards.json
  def create
    @flashcard = Flashcard.new(flashcard_params)
    @deck = Deck.find(params[:deck_id])

    respond_to do |format|
      if @flashcard.save
        format.html { redirect_to @deck, notice: 'Flashcard was successfully created.' }
        format.json { render action: 'show', status: :created, location: @flashcard }
      else
        format.html { render action: 'new' }
        format.json { render json: @flashcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flashcards/1
  # PATCH/PUT /flashcards/1.json
  def update
    respond_to do |format|
      if @flashcard.update(flashcard_params)
        format.html { redirect_to @flashcard, notice: 'Flashcard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @flashcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flashcards/1
  # DELETE /flashcards/1.json
  def destroy
    @flashcard.destroy
    respond_to do |format|
      format.html { redirect_to flashcards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flashcard
      @flashcard = Flashcard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flashcard_params
      params.require(:flashcard).permit(:front, :back)
    end
end
