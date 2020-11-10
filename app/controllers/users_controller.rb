class UsersController < ApplicationController
  include Devise::Controllers::Helpers 
  include Pagy::Backend
  before_action :authenticate_user!
  layout 'userdash'

  def new
  end

  def show
   	@total_words = current_user.study_records.count
   	@article_count = current_user.links.count
    sort = params[:sort]
    sort = 'updated_at DESC' unless sort.in?(['study_records.updated_at DESC', 'study_records.updated_at ASC'])
   	if params[:tab] == "deleted-words"
  		@pagy, @deleted_words = pagy(current_user.entries.deleted(sort))
  	else
		@pagy, @links = pagy(current_user.links.ordered_by_newest)
	end

  end

end

