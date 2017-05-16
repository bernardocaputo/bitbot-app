require 'json'
require 'sinatra'
require 'sinatra/activerecord'

require './config/database'

class App < Sinatra::Base # é isso que coloca o sinatra no projeto
  get '/' do
    'Hello world!'
  end
end
