require 'json'
require 'sinatra'
require 'sinatra/activerecord'

require './config/database'

# Load Models => poderia fazer um require './app/models/blabla.rb' para cada model mas assim automatiza
Dir["./app/models/*.rb"].each {|file| require file }

class App < Sinatra::Base # é isso que coloca o sinatra no projeto
  get '/sinatra' do
    'Hello world!'
  end
end
