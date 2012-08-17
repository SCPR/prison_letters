$: << '.'

require 'rubygems'
require 'sinatra'

require 'app.rb'
use Rack::ShowExceptions
run Sinatra::Application
