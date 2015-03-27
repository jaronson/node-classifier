#!/usr/bin/env ruby
APP_ROOT = File.join(File.dirname(__FILE__), '..')

$:.unshift(APP_ROOT)
$:.unshift("#{APP_ROOT}/lib")

require 'rubygems'
require 'bundler/setup'
