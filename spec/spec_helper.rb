require 'rspec'
require 'capybara'
require_relative 'create_test_database'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'capybara/rspec'
require 'pg'
require 'simplecov'
require 'simplecov-console'

require File.join(File.dirname(__FILE__), '..', 'app.rb')


ENV['ENVIRONMENT'] = 'test'

Capybara.app = Makersbnb

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start


RSpec.configure do |config|

  config.before(:each) do
    setup_test_database
  end
 
  config.expect_with :rspec do |expectations|
   
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  
  config.mock_with :rspec do |mocks|
    
    mocks.verify_partial_doubles = true
  end

 
  config.shared_context_metadata_behavior = :apply_to_host_groups

 
end


