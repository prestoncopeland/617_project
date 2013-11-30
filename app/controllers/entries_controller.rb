class EntriesController < ApplicationController

  before_action :require_user
  before_action :set_entry, :except => [:new, :create, :index]

  def show
    @journal_comment = JournalComment.new
    @journal_comments = @entry.journal_comments
  end

  def edit
  end

  def update
    if @entry.update_attributes(entry_params)
      flash[:success] = "Entry was successfully updated."
      redirect_to journal_path(@journal)
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy
    redirect_to journal_path(@journal)
  end

  def new
    @journal = Journal.find(params[:journal_id])
    @entry = Entry.new
  end

  def create
    @journal = Journal.find(params[:journal_id])
    @entry = @journal.entries.new(entry_params)

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

  def review
    @teachers = User.where("teacher = ?", true)
  end

  private

  def set_entry
    @journal = Journal.find(params[:journal_id])
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:title, :language, :entry, :journal_id)
  end

end
