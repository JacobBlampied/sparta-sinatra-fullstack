require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/Car.rb'
require_relative './models/User.rb'
# require_relative './controllers/static_controller.rb'
require_relative './controllers/cars_controller.rb'
require_relative './controllers/users_controller.rb'

use Rack::Reloader
use Rack::MethodOverride

run Rack::Cascade.new([
  # StaticController,
  CarsController,
  UserController
])
