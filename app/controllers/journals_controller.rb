class JournalsController < ApplicationController

  before_action :require_user

  def show
    @user = current_user
    @journal = @user.journal
    @entries = @journal.entries
    @total_entries = @journal.entries.size
    @distinct_langs = Entry.select("distinct language").map {|a| a.language}
  end

  def edit
    @journal = Journal.find(params[:id])
  end

  def update
    @journal = Journal.find(params[:id])
    if @journal.update_attributes(journal_params)
      flash[:success] = "Journal was successfully updated."
      redirect_to @journal
    else
      render 'edit'
    end
  end

  def destroy
    @journal = Journal.find(params[:id])
    @journal.destroy
    redirect_to journals_url
  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.new(journal_params)
    @journal.user = current_user
    if @journal.save
      flash[:success] = "Journal created"
      redirect_to 'show'
    else
      render 'new'
    end
  end

  def index
    @journals = Journal.all
  end

  private

  def journal_params
    params.require(:journal).permit(:user_id, :title)
  end
end