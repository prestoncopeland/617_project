class JournalCommentsController < ApplicationController

before_action :require_user

  def new
    @journal_comment = JournalComment.new
  end

  def create
          @entry = Entry.find_by(params[:entry_id])
          @journal_comment = @entry.journal_comments.new(journal_comment_params)
          @journal_comment.creator = current_user
          if @journal_comment.save
                  flash[:notice] = "Your comment was created"
                  redirect_to journal_path(@entry.journal_id)
          else
                  render 'entry/show'
          end
  end

  def show
    @entry = Entry.find(params[:id])
    @journal_comments = @entry.journal_comments
    @commenter_ids = @journal_comments.map {|comment| comment.user_id}
    @commenters = User.find(@commenter_ids)
  end

  def journal_comment_params
          params.require(:journal_comment).permit(:body, :user_id)
  end

end