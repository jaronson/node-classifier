SPEC_ROOT = File.join(File.dirname(__FILE__), '..')
ENV['RACK_ENV'] = 'test'

require "#{SPEC_ROOT}/bin/boot"
require 'database_cleaner'
require 'rack/test'
require 'pry'
require 'json'
require 'yaml'
require 'securerandom'

require 'node_classifier'

db_config = YAML.load_file(
  File.join(File.dirname(__FILE__), '..', 'db', 'config.yml')
)['test']

Dir['spec/support/**/*.rb'].each {|f| require f }

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before(:suite) do
    ActiveRecord::Base.establish_connection(db_config)
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

end
