class EntriesController < ApplicationController

  before_action :require_user
  before_action :set_entry

  def show
  end

  def edit
  end

  def update
    if @entry.update_attributes(entry_params)
      flash[:success] = "Entry was successfully updated."
      redirect_to @entry
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy
    redirect_to entries_url
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = @journal.entries.new(entry_params)
    @entry.journal_id = @journal.id

    if @entry.save
      flash[:success] = "Entry created"
      redirect_to @journal
    else
      render 'new'
    end
  end

  def index
    @entries = Entry.all
  end

  private

  def set_entry
   @journal = Journal.find_by(params[:journal_id])
   @entry = @journal.entries.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:title, :language, :entry, :journal_id)
  end

end
