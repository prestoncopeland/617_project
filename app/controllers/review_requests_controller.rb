class ReviewRequestsController < ApplicationController
  before_filter :require_user

  def create
    @review_request = ReviewRequest.new(review_request_params)
    @review_request.learner_id = current_user.id
    @review_request.save and redirect_to current_user, :notice => "Request Completed"
  end

  def index
    if current_user.is_teacher?
      @review_requests = ReviewRequest.where("teacher_id = ?", current_user.id)
    else
      @review_requests = ReviewRequest.where("learner_id = ?", current_user.id)
    end
  end

  def destroy
    @review_request = ReviewRequest.find(params[:id])
    @review_request.destroy and
    redirect_to request.referrer, :notice => "Request Completed"
  end

  private

  def review_request_params
    params.require(:review_request).permit(:teacher_id, :learner_id, :message, :entry_id)
  end
end