require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/advanced_routes'
require 'active_support/json'
require 'yaml'

class NodeClassifier::App < Sinatra::Application
  include Sinatra::JSON
  include NodeClassifier::Models

  configure do
  end

  helpers do
    def database_config
      return @database_config if @database_config

      config = YAML.load_file("#{APP_ROOT}/db/config.yml").deep_symbolize_keys
      @database_config = config.fetch(settings.environment)
    end

    def find_record(klass)
      klass.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      halt 404
    end

    def payload
      return @payload if @payload

      input    = request.env['rack.input']
      @payload = {}
      @payload = JSON.parse(input.read) if input.size > 0
      @payload
    end
  end

  before do
    ActiveRecord::Base.establish_connection(database_config)
  end

  get '/v1/groups' do
    json Group.all
  end

  get '/v1/groups/:id' do
    json find_record(Group)
  end

  put '/v1/groups/:id' do
    @group = Group.new(payload.merge(:id => params[:id]))

    if @group.save
      status 201
    else
      status 400
    end

    json @group
  end

  delete '/v1/groups/:id' do
    @group = find_record(Group)
    @group.delete

    status 204
  end
end
