class JobPositionsController < ApplicationController
  before_action :set_job_position, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @job_position = JobPosition.new
  end

  def edit
  end

  def create
    @job_position = JobPosition.new(job_position_params)

    respond_to do |format|
      if @job_position.save
        format.html { redirect_to @job_position, notice: 'Job position was successfully created.' }
        format.json { render :show, status: :created, location: @job_position }
      else
        format.html { render :new }
        format.json { render json: @job_position.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job_position.update(job_position_params)
        format.html { redirect_to @job_position, notice: 'Job position was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_position }
      else
        format.html { render :edit }
        format.json { render json: @job_position.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job_position.destroy
    respond_to do |format|
      format.html { redirect_to job_positions_url, notice: 'Job position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_job_position
      @job_position = JobPosition.find(params[:id])
    end

    def job_position_params
      params.fetch(:job_position, {}).permit(:title, :account_id, :status, :mission_statement)
    end
end
