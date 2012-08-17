require 'rubygems'
require 'sinatra'

set :environment, :production
disable :run

require 'app'
use Rack::ShowExceptions
run Sinatra::Application
