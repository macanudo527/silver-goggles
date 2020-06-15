class StudySetsController < ApplicationController
  include Devise::Controllers::Helpers 
  before_action :authenticate_user!
  before_action :set_study_set, only: [:show, :edit, :update, :destroy]
  before_action :set_extra_answers, only: [:index, :show]

  # GET /study_sets
  # GET /study_sets.json
  def index
     respond_to do |format|
      format.html { render 'show' }

      # add details here!
      format.json { render json: { :part_of_set => json_params_for(Entry.joins(:study_records).where("study_records.due < ?", Time.now)),  
        :extra_answers => @extra_answers } }
    end 
  end

  # GET /study_sets/1
  # GET /study_sets/1.json
  def show
    @article_link = @study_set.link.url

    respond_to do |format|
      format.html
      format.json { render json: { :part_of_set => json_params_for(@study_set.entries.joins(:study_records).where("study_records.due < ?", Time.now)),  
        :extra_answers => @extra_answers } }
    end
  end

  # @study_set.study_records.entries.where("study_records.due < ?", Time.now)

  # GET /study_sets/new
  def new
    @study_set = StudySet.new
  end

  # GET /study_sets/1/edit
  def edit
  end

  # POST /study_sets
  # POST /study_sets.json
  def create
    @study_set = StudySet.new(user_id: current_user.id, link_id: params[:study_set][:link_id])
    @study_set.entries << Entry.find(params[:study_set][:entry_id])

    respond_to do |format|
      if @study_set.save
        format.html { redirect_to @study_set, notice: 'Study set was successfully created.' }
        format.json { render json: @study_set.entries }
      else
        format.html { render :new }
        format.json { render json: @study_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_sets/1
  # PATCH/PUT /study_sets/1.json
  def update
    @new_entries = params[:study_set][:entry_id] - @study_set.entry_ids
    @study_set.entry_ids = params[:study_set][:entry_id]
    respond_to do |format|
      if !@study_set.errors.present?
        if params.has_key? 'save-return'
          format.html { redirect_to current_user, notice: 'Study set was successfully updated.'  }
        else
          format.html { redirect_to @study_set, notice: 'Study set was successfully updated.' }
          format.json { render :show, status: :ok, location: @study_set }
        end
      else
        format.html { render :edit }
        format.json { render json: @study_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_sets/1
  # DELETE /study_sets/1.json
  def destroy
    @study_set.destroy
    respond_to do |format|
      format.html { redirect_to study_sets_url, notice: 'Study set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_set
      @study_set = StudySet.find(params[:id])
    end

    def set_extra_answers
      # This should be replaced with words the user knows in the future.
      @extra_answers = Entry.order(Arel.sql('RAND()')).take(5)
    end

    # Only allow a list of trusted parameters through.
    def study_set_params
      params.require(:study_set).permit(:return, :user_id, :link_id, :entry_id => [] )
    end

    def json_params_for(entries)
      collection = entries.map do |entry|
        { id: entry.id,
          word: entry.word,
          reading: entry.reading,
          definition: entry.definition,
          priority: entry.priority,
          base_word: entry.base_word,
          grammar: entry.grammar,
          mastery: entry.study_records.find_by(user: current_user).mastery
        }
      end
    end

end
