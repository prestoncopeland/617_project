class TutionSessionsController < ApplicationController
  before_action :set_tution_session, only: [:show, :edit, :update, :destroy]
  before_filter :require_teacher, :except => [:show, :index]

  def index
    @tution_sessions = TutionSession.all
  end

  def show
  end

  def new
    @tution_session = TutionSession.new
  end

  def edit
    @tution_session.get_start_time
    @tution_session.get_end_time
  end

  def create
    @tution_session = current_user.tution_sessions.new(tution_session_params)

    respond_to do |format|
      if @tution_session.save
        format.html { redirect_to @tution_session, notice: 'Tution session was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tution_session }
      else
        format.html { render action: 'new' }
        format.json { render json: @tution_session.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tution_session.update(tution_session_params)
        format.html { redirect_to @tution_session, notice: 'Tution session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tution_session.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tution_session.destroy
    respond_to do |format|
      format.html { redirect_to tution_sessions_url }
      format.json { head :no_content }
    end
  end

  private
    def set_tution_session
      @tution_session = TutionSession.find(params[:id])
    end

    def tution_session_params
      params.require(:tution_session).permit(:start_time, :end_time, :title, :description, :start_time_date, :start_time, :end_time_date, :end_time)
    end
end
