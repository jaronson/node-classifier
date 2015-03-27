require File.join(File.dirname(__FILE__), 'bin', 'boot')

require 'sinatra'
require 'node_classifier'

use Rack::Logger
run NodeClassifier::App.new
