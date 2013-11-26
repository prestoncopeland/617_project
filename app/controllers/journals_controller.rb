class JournalsController < ApplicationController

  before_action :require_user

  def show
    @journal = Journal.find(params[:id])
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
    redirect_to current_user
  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = current_user.build_journal(journal_params)
    if @journal.save
      flash[:success] = "Journal created"
      redirect_to journal_path(@journal)
    else
      render 'new'
    end
  end

  def index
    @journals = Journal.all
  end

  private

  def journal_params
    params.require(:journal).permit(:user_id, :title, :entry_ids => [])
  end
end