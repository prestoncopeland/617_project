class PrivateForumsController < ApplicationController
  before_action :set_private_forum, only: [:show, :edit, :update, :destroy, :messages]

  before_filter :require_user
  
  def index
    @private_forums = PrivateForum.all
  end

  def show
  end

  def new
    @private_forum = PrivateForum.new
  end

  def edit
  end

  def create
    @private_forum = current_user.private_forums.new(:tution_session_id => params[:tution_session_id])

    respond_to do |format|
      if @private_forum.save
        format.html { redirect_to request.referrer, :notice => "Request Completed" }
        format.json { render action: 'show', status: :created, location: @private_forum }
      else
        format.html { render action: 'new' }
        format.json { render json: @private_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @private_forum.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, :notice => "Request Completed" }
      format.json { head :no_content }
    end
  end

  def messages
    if @private_forum.user == current_user or @private_forum.teacher == current_user
      @message = Message.new
      @messages = @private_forum.messages
    else
      redirect_to root_path, :alert => "Access Denied"
    end
  end

  private
  def set_private_forum
    @private_forum = PrivateForum.find(params[:id])
  end

  def private_forum_params
    params.require(:private_forum).permit(:user_id, :tution_session_id, :accept)
  end
end
