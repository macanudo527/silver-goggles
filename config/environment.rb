
# in config/environment.rb
# Load the Rails application.
require File.expand_path('../application', __FILE__)
# Initialize the Rails application.
Rails.application.initialize!
# If in Spring & test env, load spec_helper.rb
if ENV['SPRING_ENV'] == 'test' && ENV['RAILS_ENV'] == 'test'
  require File.expand_path('../../spec/spec_helper', __FILE__)
end
