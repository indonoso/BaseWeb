class PendingWorksController < ApplicationController
  before_action :set_pending_work, only: [:show, :edit, :update, :destroy, :finish, :edit_and_finish]

  # GET /pending_works
  # GET /pending_works.json
  def index
    @pending_works = PendingWork.all

  end

  # GET /pending_works/1
  # GET /pending_works/1.json
  def show
  end

  # GET /pending_works/new
  def new
    @pending_work = PendingWork.new
  end

  # GET /pending_works/1/edit
  def edit
  end

  def pause
    @pending_work.paused = true
    @pending_work.cumulative_minutes = @pending_work.elapsed_time

  end

  def resume
    @pending_work.paused = false
    @pending_work.starting_time = Time.now
  end

  def finish
    @work_hour = WorkHour.new
    @work_hour.work_date = Time.now.to_date
    @work_hour.user = @pending_work.user
    @work_hour.minutes = @pending_work.elapsed_time
    @work_hour.project = @pending_work.project
    @work_hour.description = @pending_work.description

    if @work_hour.save
      @pending_work.destroy
      redirect_to @work_hour, notice: 'Work hour was successfully created.'
    end

  end
    

  # POST /pending_works
  # POST /pending_works.json
  def create
    @pending_work = PendingWork.new(pending_work_params)
    
    if user_signed_in?
      @pending_work.user = current_user
    end

    @pending_work.starting_time = Time.now
    @pending_work.cumulative_minutes = 0

    respond_to do |format|
      if @pending_work.save
        format.html { redirect_to @pending_work, notice: 'Pending work was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pending_work }
      else
        format.html { render action: 'new' }
        format.json { render json: @pending_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pending_works/1
  # PATCH/PUT /pending_works/1.json
  def update
    respond_to do |format|
      if @pending_work.update(pending_work_params)
        format.html { redirect_to @pending_work, notice: 'Pending work was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pending_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pending_works/1
  # DELETE /pending_works/1.json
  def destroy
    @pending_work.destroy
    respond_to do |format|
      format.html { redirect_to pending_works_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pending_work
      @pending_work = PendingWork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pending_work_params
      params.require(:pending_work).permit(:starting_time, :user_id, :project_id, :description, :cumulative_minutes)
    end
end
