class StudyRecordsController < ApplicationController
  before_action :set_study_record, only: [:show, :edit, :update, :destroy]

  # GET /study_records
  # GET /study_records.json
  def index
    @study_records = StudyRecord.all
  end

  # GET /study_records/1
  # GET /study_records/1.json
  def show
  end

  # GET /study_records/new
  def new
    @study_record = StudyRecord.new
  end

  # GET /study_records/1/edit
  def edit
  end

  # POST /study_records
  # POST /study_records.json
  def create
    @study_record = StudyRecord.new(study_record_params)

    respond_to do |format|
      if @study_record.save
        format.html { redirect_to @study_record, notice: 'Study record was successfully created.' }
        format.json { render :show, status: :created, location: @study_record }
      else
        format.html { render :new }
        format.json { render json: @study_record.errors, status: :unprocessable_entity }
      end
    end
  end

  def master 
    @entry_id = params[:study_record][:entry_id]
    @study_record = StudyRecord.find_or_initialize_by(user: current_user, entry_id: @entry_id)
    @study_record.toggle!(:deleted)
    respond_to do |format|
        format.html { redirect_to link_entries_path(@link) }
        format.json { render json: @entry_id, status: :ok }
        format.js { }
      end
  end

  # PATCH/PUT /study_records/1
  # PATCH/PUT /study_records/1.json
  def update
    respond_to do |format|
      if @study_record.update(study_record_params)
        format.html { redirect_to @study_record, notice: 'Study record was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_record }
      else
        format.html { render :edit }
        format.json { render json: @study_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_records/1
  # DELETE /study_records/1.json
  def destroy
    @study_record.destroy
    respond_to do |format|
      format.html { redirect_to study_records_url, notice: 'Study record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_record
      @study_record = StudyRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def study_record_params
      params.require(:study_record).permit(:user_id, :entry_id, :mastery)
    end
end
