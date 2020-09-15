class UserSettingsController < ApplicationController
  include Devise::Controllers::Helpers 
  before_action :authenticate_user!

  def index

  end


  def create
  	@user_setting = UserSetting.find_by(user: current_user, setting_id: user_setting_params[:setting_id])	
    respond_to do |format|

      if @user_setting.update(unconstrained_value: user_setting_params[:unconstrained_value], 
      	allowed_setting_value_id: user_setting_params[:allowed_setting_value_id])

        format.html { redirect_to @user_setting, notice: 'User Setting was successfully updated.' }
        format.json { render json: @user_setting, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @user_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_setting
      @user_setting = UserSetting.find(params[:id])
    end  

    def user_setting_params
    	params.require(:user_setting).permit(:setting_id, :allowed_setting_value_id, :unconstrained_value)
    end


end