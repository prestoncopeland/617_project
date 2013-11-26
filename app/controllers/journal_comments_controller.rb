class JournalCommentsController < ApplicationController
  before_action :set_journal_comment, only: [:show, :edit, :update, :destroy]
  before_filter :require_user

  # GET /journal_comments
  # GET /journal_comments.json
  def index
    @journal_comments = JournalComment.all
  end

  # GET /journal_comments/1
  # GET /journal_comments/1.json
  def show
  end

  # GET /journal_comments/new
  def new
    @journal_comment = JournalComment.new
  end

  # GET /journal_comments/1/edit
  def edit
  end

  # POST /journal_comments
  # POST /journal_comments.json
  def create
    @journal_comment = current_user.journal_comments.new(journal_comment_params)
    respond_to do |format|
      if @journal_comment.save
        format.html { redirect_to request.referrer, notice: 'Request Completed.' }
        format.json { render action: 'show', status: :created, location: @journal_comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @journal_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journal_comments/1
  # PATCH/PUT /journal_comments/1.json
  def update
    respond_to do |format|
      if @journal_comment.update(journal_comment_params)
        format.html { redirect_to @journal_comment, notice: 'Journal comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @journal_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journal_comments/1
  # DELETE /journal_comments/1.json
  def destroy
    @journal_comment.destroy
    respond_to do |format|
      format.html { redirect_to journal_comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal_comment
      @journal_comment = JournalComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_comment_params
      params.require(:journal_comment).permit(:entry_id, :user_id, :content)
    end
end
