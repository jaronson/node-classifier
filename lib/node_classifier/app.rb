require 'sinatra/base'
require 'sinatra/json'
require 'active_support/json'
require 'sinatra/advanced_routes'

class NodeClassifier::App < Sinatra::Application
  include Sinatra::JSON

  get '/v1/groups' do
  end

  get '/v1/groups/:id' do
  end

  put '/v1/groups/:id' do
  end

  delete '/v1/groups/:id' do
  end
end
