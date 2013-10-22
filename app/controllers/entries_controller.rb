class EntriesController < ApplicationController

  before_action :require_user

  def show
    @user = current_user
    @journal = @user.journal
    @entry = Entry.find(params[:entry_id])
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(entry_params)
      flash[:success] = "Entry was successfully updated."
      redirect_to @entry
    else
      render 'edit'
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to entries_url
  end

  def new
    @entry = Entry.new
  end

  def create
    @user = current_user
    @journal = @user.journal
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

  def entry_params
    params.require(:entry).permit(:title, :language, :entry, :journal_id)
  end
end
