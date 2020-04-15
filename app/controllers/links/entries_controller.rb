module Links
  class EntriesController < ApplicationController
    before_action :set_entry, only: [:show, :edit, :update, :destroy]
    before_action :set_link

    # GET /entries
    # GET /entries.json
    def index
      @priority_entries = @link.entries.where(grammar: false, priority: true)
      @entries = @link.entries.where(grammar: false, priority: false).where.not(base_word: @priority_entries.pluck(:base_word))
      @grammar_entries = @link.entries.where(grammar: true)
      @study_set = @link.study_sets.new()
    end

    # GET /entries/1
    # GET /entries/1.json
    def show
    end

    # GET /entries/new
    def new
      @entry = Entry.new
    end

    # GET /entries/1/edit
    def edit
      respond_to do |format|
        format.html {}
        format.js
      end

    end

    # POST /entries
    # POST /entries.json
    def create
      @entry = Entry.new(entry_params)

      respond_to do |format|
        if @entry.save
          format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
          format.json { render :show, status: :created, location: @entry }
        else
          format.html { render :new }
          format.json { render json: @entry.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /entries/1
    # PATCH/PUT /entries/1.json
    def update
      respond_to do |format|
        if @entry.update(entry_params)
          format.html { redirect_to link_entry_path(@link, @entry), notice: 'Entry was successfully updated.' }
          format.js { redirect_to link_entries_path(@link)}
          format.json { render :show, status: :ok, location: @entry }
        else
          format.html { render :edit }
          format.json { render json: @entry.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /entries/1
    # DELETE /entries/1.json
    def destroy
      @entry.destroy
      respond_to do |format|
        format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_entry
        @entry = Entry.find(params[:id])
      end

      def set_link
        @link = Link.find(params[:link_id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def entry_params
        params.require(:entry).permit(:word, :reading, :definition, :priority, :base_word, :grammar)
      end
  end
end
