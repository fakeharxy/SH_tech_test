ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'capybara/rspec'
require 'mongoid'
require 'database_cleaner'
require 'webmock'
require 'vcr'

Mongoid.load! 'mongoid.config'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.include Capybara
end

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
end

require File.expand_path '../app.rb', __dir__

Capybara.app = Sinatra::Application
