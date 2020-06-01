class UsersController < ApplicationController
  include Devise::Controllers::Helpers 
  before_action :authenticate_user!

  def new
  end

  def show
  	@links = current_user.links.sort_by{ |a| a[:created_at] }.reverse!
  	@total_words = current_user.study_records.count
  end

end

