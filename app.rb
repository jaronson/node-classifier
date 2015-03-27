#!/usr/bin/env ruby
require File.join(File.dirname(__FILE__), 'bin', 'boot')

require 'sinatra/base'
require 'sinatra/json'
require 'active_support/json'
require 'sinatra/advanced_routes'

class App < Sinatra::Application
  include Sinatra::JSON
end
