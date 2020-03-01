class ClicksController < ApplicationController
before_action :authenticate_user!, :set_click, only: [:show, :edit, :update, :destroy] 

  # GET /links
  # GET /links.json
  def index
    @clicks = Click.all
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @click = Click.new
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  # USER is STUBBED, needs updating once Devise is installed!
  def create
  	@link = Link.find(params[:link])

  	@click = @link.clicks.find_by(:user_id => current_user)
  	if !@click.nil?
  		@click.increment(:click_count, 1)
  	else
  		@click = @link.clicks.new
  		@click.user = current_user
  	end

    respond_to do |format|
      if @click.save
        format.html { redirect_to @click.link.url, notice: 'Click was successfully created.' }
        format.json { render :show, status: :created, location: @click }
      else
        format.html { render :new }
        format.json { render json: @click.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @click.update(click_params)
        format.html { redirect_to @click, notice: 'Click was successfully updated.' }
        format.json { render :show, status: :ok, location: @click }
      else
        format.html { render :edit }
        format.json { render json: @click.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @click.destroy
    respond_to do |format|
      format.html { redirect_to clicks_url, notice: 'Click was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_click
      @click = Click.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def click_params
      params.require(:click).permit(:link_id)
    end

    def link_params
    	params.require(:link).permit(:link)
    end
end

