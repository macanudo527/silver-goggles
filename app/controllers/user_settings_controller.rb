class StudySetsController < ApplicationController
  include Devise::Controllers::Helpers 
  before_action :authenticate_user!

end